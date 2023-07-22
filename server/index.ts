import admin from "firebase-admin";
import * as serviceAccount from "./manajemen-kost.json";
import { message } from "./data";
import {
  IKamar,
  INaiveBayes,
  IPenghuni,
  IPemberitahuan,
  MessageProps,
} from "./types";

const params = {
  type: serviceAccount.type,
  projectId: serviceAccount.project_id,
  privateKeyId: serviceAccount.private_key_id,
  privateKey: serviceAccount.private_key,
  clientEmail: serviceAccount.client_email,
  clientId: serviceAccount.client_id,
  authUri: serviceAccount.auth_uri,
  tokenUri: serviceAccount.token_uri,
  authProviderX509CertUrl: serviceAccount.auth_provider_x509_cert_url,
  clientC509CertUrl: serviceAccount.client_x509_cert_url,
};

const app = admin.initializeApp({
  credential: admin.credential.cert(params),
});

const firestore = admin.firestore(app);
const messaging = admin.messaging(app);

async function sendNotification(props: MessageProps) {
  try {
    const data = message(props);
    const response = await messaging.send(data);
    console.log("Notification sent successfully:", response);
  } catch (error) {
    console.error("Error sending notification:", error);
  }
}

function main() {
  const listPenghuni = [];
  const queryKamar = firestore.collection("kamar");
  const queryNaiveBayes = firestore.collection("naive_bayes");
  const queryPemberitahuan = firestore.collection("pemberitahuan");

  queryNaiveBayes.onSnapshot(
    (snapshot) => {
      snapshot.docs.forEach((docNB) => {
        const data = docNB.data() as INaiveBayes;
        const currentTime = admin.firestore.Timestamp.now();

        const targetTimestamp = data.tglJatuhTempo;
        const targetTime = data.tglJatuhTempo.toDate();
        const min3Day = new Date(targetTime);
        min3Day.setDate(min3Day.getDate() - 3);
        const min3DayTimestamp = admin.firestore.Timestamp.fromDate(min3Day);

        //kode di bawah ini akan mencari nomor kamar berdasarkan variabel data.idKamar.id
        queryKamar
          .where(admin.firestore.FieldPath.documentId(), "==", data.idKamar.id)
          .get()
          .then((querySnapshot) => {
            querySnapshot.forEach((doc) => {
              // console.log(doc.id, '=>', doc.data());
              const data = doc.data() as IKamar;
              // kode dibawah ini akan menambahkan penghuni kamar
              // yang menjadi penanggung jawabk edalam variabel listPenghuni
              listPenghuni.push(data.penghuni[0].id);
            });
            console.log("Penghuni:", listPenghuni);
          })
          .catch((error) => {
            console.log("Error getting documents: ", error);
          });

        if (currentTime >= min3DayTimestamp && currentTime < targetTimestamp) {
          console.log(
            `Kamar ${data.idKamar.id} dalam tiga hari ke depan akan jatuh tempo`
          );

          if (listPenghuni.length > 0) {
            const firstValue = listPenghuni[0];
            // const notificationMessage = {
            //   notification: {
               
            //   },
            //   topic: firstValue, // topic to send the notification
            // };
            // kode dibawah ini akan mengirim notifikasi
            sendNotification({
              topic: firstValue,
              title: "Info",
              body: `Kamar ${data.idKamar.id} dalam tiga hari ke depan akan jatuh tempo`,
            });
            console.log("First value:", firstValue);
            // kode dibawah ini akan mengirim data notifikasi ke tabel pemberitahuan
            const newPemberitahuan: IPemberitahuan = {
              dateUpload: admin.firestore.Timestamp.now(),
              idKamar: data.idKamar,
              deskripsi: `Kamar ${data.idKamar.id} dalam tiga hari ke depan akan jatuh tempo`,
              tglJatuhTempo: data.tglJatuhTempo,
              isView: false,
            };
            queryPemberitahuan
              .add(newPemberitahuan)
              .then((docRef) => {
                console.log(
                  "Pemberitahuan 3 hari sebelum jatuh tempo berhasil ditambahkan dengan ID:",
                  docRef.id
                );
              })
              .catch((error) => {
                console.error("Error menambahkan pemberitahuan:", error);
              });
          } else {
            console.log("The list is empty.");
          }
        } else if (currentTime >= targetTimestamp) {
          console.log(`Kamar ${data.idKamar.id} telah jatuh tempo`);
          if (listPenghuni.length > 0) {
            const firstValue = listPenghuni[0];

            // kode dibawah ini akan mengirim notifikasi
            sendNotification({
              topic: firstValue,
              title: "Info",
              body: `Kamar ${data.idKamar.id} telah jatuh tempo`,
            });
            console.log("First value:", firstValue);
            // kode dibawah ini akan mengirim data notifikasi ke tabel pemberitahuan
            const newPemberitahuan: IPemberitahuan = {
              dateUpload: admin.firestore.Timestamp.now(),
              idKamar: data.idKamar,
              deskripsi: `Kamar ${data.idKamar.id} telah jatuh tempo`,
              tglJatuhTempo: data.tglJatuhTempo,
              isView: false,
            };
            queryPemberitahuan
              .add(newPemberitahuan)
              .then((docRef) => {
                console.log(
                  "Pemberitahuan jatuh tempo berhasil ditambahkan dengan ID:",
                  docRef.id
                );
              })
              .catch((error) => {
                console.error("Error menambahkan pemberitahuan:", error);
              });
          } else {
            console.log("The list is empty.");
          }
          queryNaiveBayes.doc(docNB.id).update({ statusKamar: false });
        }
        if (data.statusKamar === false) {
          console.log(`Status kamar ${data.idKamar.id} = false`);
        }
        // listPenghuni = [];
        // kode dibawah ini akan mengosongkan kembali variabel listPenghuni
        listPenghuni.splice(0);
      });
    },
    (error) => {
      console.log("Error getting documents: ", error);
    }
  );
}

main();
