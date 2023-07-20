import admin from "firebase-admin"
import * as serviceAccount from './manajemen-kost.json'
import { message } from './data'
import { IKamar, INaiveBayes, IPenghuni, IPemberitahuan } from "./types";

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
    clientC509CertUrl: serviceAccount.client_x509_cert_url
}

const app = admin.initializeApp({
    credential: admin.credential.cert(params)
});

const firestore = admin.firestore(app);

const queryKamar = firestore.collection("kamar")
const queryNaiveBayes = firestore.collection("naive_bayes")
const queryPemberitahuan = firestore.collection("pemberitahuan")

function main() {
    const targetId = '07 A';
    const listKamar = [];
    const listPenghuni = [];

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

                if (currentTime == min3DayTimestamp && currentTime < targetTimestamp) {
                    console.log(`Kamar ${data.idKamar.id} dalam tiga hari ke depan akan jatuh tempo`);
                } else if (currentTime == targetTimestamp) {
                    console.log(`Kamar ${data.idKamar.id} telah jatuh tempo`);
                }
                if (data.statusKamar === false) {
                    console.log(`Status kamar ${data.idKamar.id} = false`);
                }
            });
        },
        (error) => {
            console.log("Error getting documents: ", error);
        }
    );

    // queryNaiveBayes.onSnapshot(
    //     (snapshot) => {
    //         snapshot.docs.forEach((docNB) => {
    //             const data = docNB.data() as INaiveBayes;

    //             // const batch = firestore.batch();
    //             const currentTime = admin.firestore.Timestamp.now();

    //             const targetTime = data.tglJatuhTempo;
    //             const min3Day = targetTime.toDate().setDate(targetTime.toDate().getDate() - 3);
    //             const min3DayTimestamp = admin.firestore.Timestamp.fromMillis(min3Day);

    //             if (currentTime >= min3DayTimestamp) {
    //                 console.log('kamar dalam tiga hari ke depan akan jatuh tempo')
    //                 // const newPemberitahuan: IPemberitahuan = {
    //                 //     dateUpload: admin.firestore.Timestamp.now(),
    //                 //     idKamar: data.idKamar, // Ganti dengan path referensi dokumen yang sesuai
    //                 //     deskripsi: "Deskripsi pemberitahuan",
    //                 //     tglJatuhTempo: data.tglJatuhTempo,
    //                 //     isView: false // Ganti dengan tanggal jatuh tempo yang sesuai
    //                 // };
    //                 // queryPemberitahuan
    //                 //     .add(newPemberitahuan)
    //                 //     .then((docRef) => {
    //                 //         console.log("Pemberitahuan jatuh tempo berhasil di tambahkan berhasil ditambahkan dengan ID:", docRef.id);
    //                 //     })
    //                 //     .catch((error) => {
    //                 //         console.error("Error menambahkan pemberitahuan:", error);
    //                 //     });
    //                 //     queryNaiveBayes.doc(docNB.id).update({statusKamar: false, })
    //             }
    //             if (currentTime >= targetTime) {
    //                 console.log('kamar telah jatuh tempo')
    //                 // const newPemberitahuan: IPemberitahuan = {
    //                 //     dateUpload: admin.firestore.Timestamp.now(),
    //                 //     idKamar: data.idKamar, // Ganti dengan path referensi dokumen yang sesuai
    //                 //     deskripsi: "Deskripsi pemberitahuan",
    //                 //     tglJatuhTempo: data.tglJatuhTempo,
    //                 //     isView: false // Ganti dengan tanggal jatuh tempo yang sesuai
    //                 // };
    //                 // queryPemberitahuan
    //                 //     .add(newPemberitahuan)
    //                 //     .then((docRef) => {
    //                 //         console.log("Pemberitahuan jatuh tempo berhasil di tambahkan berhasil ditambahkan dengan ID:", docRef.id);
    //                 //     })
    //                 //     .catch((error) => {
    //                 //         console.error("Error menambahkan pemberitahuan:", error);
    //                 //     });
    //                 //     queryNaiveBayes.doc(docNB.id).update({statusKamar: false, })
    //             }
    //             if(data.statusKamar === false){
    //                 console.log('status kamar = false')
    //                 // const newPemberitahuan: IPemberitahuan = {
    //                 //     dateUpload: admin.firestore.Timestamp.now(),
    //                 //     idKamar: data.idKamar, // Ganti dengan path referensi dokumen yang sesuai
    //                 //     deskripsi: `Kamar dengan nomor ${data.idKamar.id} telah `,
    //                 //     tglJatuhTempo: data.tglJatuhTempo,
    //                 //     isView: false // Ganti dengan tanggal jatuh tempo yang sesuai
    //                 // };
    //                 // queryPemberitahuan
    //                 //     .add(newPemberitahuan)
    //                 //     .then((docRef) => {
    //                 //         console.log("Pemberitahuan status kamar berhasil ditambahkan dengan ID:", docRef.id);
    //                 //     })
    //                 //     .catch((error) => {
    //                 //         console.error("Error menambahkan pemberitahuan:", error);
    //                 //     });
    //             }

    //             // if (data.idKamar.id === targetId) {
    //             //     listKamar.push(data.idKamar);
    //             //     data.riwayatPembayaran.push({
    //             //         bulan: "",
    //             //         dateUpload: admin.firestore.Timestamp.now(),
    //             //         isBermasalah: false,
    //             //         isTahunan: "",
    //             //         sewaBulanan: "",
    //             //         sewaTahunan: "",
    //             //         tahun: "",
    //             //     })
    //             //     queryNaiveBayes.doc(docNB.id).update({ ...data })
    //             // }
    //         });
    //         console.log('List Kamar:', listKamar);
    //     },
    //     (error) => {
    //         console.log('Error getting documents: ', error);
    //     }
    // );
    queryKamar.where(admin.firestore.FieldPath.documentId(), '==', targetId)
        .get()
        .then((querySnapshot) => {
            querySnapshot.forEach((doc) => {
                // console.log(doc.id, '=>', doc.data());
                const data = doc.data() as IKamar;
                console.log(data.penghuni.forEach((docPenghuni) => {
                    listPenghuni.push(docPenghuni.id);
                }));
            });
            console.log('List Penghuni:', listPenghuni);
        })
        .catch((error) => {
            console.log('Error getting documents: ', error);
        });
    // queryPenghuni.onSnapshot((snapshot) => {
    //     snapshot.docs.map((docPenghuni) => {
    //         idPenghuni = docPenghuni.id
    //     })
    // }, (error) => {
    //     console.log({ error });
    // })
    // console.log(idPenghuni)
    // console.log(penghuniKamar)





}

main()