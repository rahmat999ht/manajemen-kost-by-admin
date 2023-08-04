import admin from "firebase-admin";
import * as serviceAccount from "./manajemen-kost.json";
import { message } from "./data";
import {
    IKamar,
    INaiveBayes,
    IPenghuni,
    IPemberitahuan,
    MessageProps,
    TimestampNow,
    Timestamp,
    IRiwayatBermasalah,
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
        const response = await messaging.send(
            {
                topic: data.topic,
                notification: data.notification,
                android: {
                    priority: "high"
                }
            }
        );

        console.log("Notification sent successfully:", response);
        console.log("topic:", data.topic);
    } catch (error) {
        console.error("Error sending notification:", error);
    }
}

let listPenghuni = [];
const queryKamar = firestore.collection("kamar");
const queryNaiveBayes = firestore.collection("naive_bayes");
const queryPemberitahuan = firestore.collection("pemberitahuan");

function main() {

    queryNaiveBayes.onSnapshot(
        (snapshot) => {
            snapshot.docs.forEach((docNB) => {

                const data = docNB.data() as INaiveBayes;

                if(data.tglJatuhTempo != null ){
                    const currentTime = TimestampNow;

                    const targetTimestamp = data.tglJatuhTempo;
                    const targetTime = data.tglJatuhTempo.toDate();
                    const min3Day = new Date(targetTime);
                    min3Day.setDate(min3Day.getDate() - 3);
                    const min3DayTimestamp = Timestamp.fromDate(min3Day);
    
                   // variabel currentTime adalah varibel peluang yg akan terjadi  prbabilitas C
                   // variabel min3DayTimestamp adalah prbabilitas B
                   // variabel targetTimestamp adalah prbabilitas A
                    fung({
                        data,
                        currentTime,
                        targetTimestamp,
                        min3DayTimestamp,
                        docNB,
                    })
    
                    // kode dibawah ini akan mengosongkan kembali variabel listPenghuni
                    listPenghuni = [];
                }     
            });
        },
        (error) => {
            console.log("Error getting documents: ", error);
        }
    );
}


const fung = async ({ data, currentTime, targetTimestamp, min3DayTimestamp, docNB }: {
    data: INaiveBayes,
    currentTime: admin.firestore.Timestamp,
    targetTimestamp: admin.firestore.Timestamp,
    min3DayTimestamp: admin.firestore.Timestamp,
    docNB: admin.firestore.QueryDocumentSnapshot<admin.firestore.DocumentData>
}) => {
    try {
        //kode di bawah ini akan mencari nomor kamar berdasarkan variabel data.idKamar.id
        const dataKamars = await queryKamar
            .where(admin.firestore.FieldPath.documentId(), "==", data.idKamar.id)
            .get()

        //kode di bawah ini akan mencari nomor noHp penghuni pada nomor kamar yang telah di dapatkan
        dataKamars.forEach((doc) => {
            const data = doc.data() as IKamar;
            // kode dibawah ini akan menambahkan penghuni kamar
            // yang menjadi penanggung jawabk edalam variabel listPenghuni
            if (data.penghuni.length > 0) {
                const idWithoutPlus = data.penghuni[0].id.replace(/\+/g, '');
                listPenghuni.push(idWithoutPlus);
                console.log(`penghuni ${idWithoutPlus}`);
            } else {
                console.log(`penghuni kosong`);
            }

        });
        console.log("Penghuni:", listPenghuni);
    } catch (error) {
        console.log("Error getting documents: ", error);
    }

    //kondisi 3 hari sebelum jatuh tempo
    if (currentTime >= min3DayTimestamp && currentTime < targetTimestamp) {
        console.log(
            `Kamar ${data.idKamar.id} dalam tiga hari ke depan akan jatuh tempo`
        );

        listPenghuni.length > 0 ?
            await jatuhTempoMin3Day({ data }) : console.log("The list is empty.");

    } else if (currentTime >= targetTimestamp) {
        console.log(`Kamar ${data.idKamar.id} telah jatuh tempo`);

        listPenghuni.length > 0 ?
            await jatuhTempo({ data }) : console.log("The list is empty.");

        // kode ini akan menonaktifkan status kamar ketika telah sampai tanggal jatuh tempo 
        await queryNaiveBayes.doc(docNB.id).update({ statusKamar: false });

    }

    //kondisi bermasalah
    if (data.statusKamar === false && data.terisi === true) {
        console.log(`Status kamar ${data.idKamar.id} = false`);

        listPenghuni.length > 0 ?
            await bermasalah({ data, docNB }) : console.log("The list is empty.");

    }
}


const jatuhTempoMin3Day = async ({ data }: { data: INaiveBayes }) => {
    const firstValue = listPenghuni[listPenghuni.length - 1];
    console.log("First value:", firstValue);

    await sendNotification({
        topic: firstValue,
        title: "Info",
        body: `Kamar ${data.idKamar.id} dalam 3 hari ke depan akan jatuh tempo`,
    });
    await sendNotification({
        topic: "BaEHJHYSl22x8NX6okHa",
        title: "Info",
        body: `Kamar ${data.idKamar.id} dalam 3 hari ke depan akan jatuh tempo`,
    });

    // kode dibawah ini akan mengirim data notifikasi ke tabel pemberitahuan
    const newPemberitahuan: IPemberitahuan = {
        dateUpload: admin.firestore.Timestamp.now(),
        idKamar: data.idKamar,
        deskripsi: `Kamar ${data.idKamar.id} dalam 3 hari ke depan akan jatuh tempo`,
        tglJatuhTempo: data.tglJatuhTempo,
        isView: false,
    };

    try {
        const Pemberitahuan = await queryPemberitahuan
            .add(newPemberitahuan)

        console.log(
            "Pemberitahuan 3 hari sebelum jatuh tempo berhasil ditambahkan dengan ID:",
            Pemberitahuan.id
        );
    } catch (error) {
        console.error("Error menambahkan pemberitahuan:", error);
    }
}

async function jatuhTempo({ data }: { data: INaiveBayes }) {

    const firstValue = listPenghuni[listPenghuni.length - 1];
    console.log("First value:", firstValue);

    // kode dibawah ini akan mengirim notifikasi
    await sendNotification({
        topic: firstValue,
        title: "Info",
        body: `Kamar ${data.idKamar.id} telah jatuh tempo`,
    });
    await sendNotification({
        topic: "BaEHJHYSl22x8NX6okHa",
        title: "Info",
        body: `Kamar ${data.idKamar.id} telah jatuh tempo`,
    });

    // kode dibawah ini akan mengirim data notifikasi ke tabel pemberitahuan
    const newPemberitahuan: IPemberitahuan = {
        dateUpload: admin.firestore.Timestamp.now(),
        idKamar: data.idKamar,
        deskripsi: `Kamar ${data.idKamar.id} telah jatuh tempo`,
        tglJatuhTempo: data.tglJatuhTempo,
        isView: false,
    };

    try {
        const pemberitahuan = await queryPemberitahuan
            .add(newPemberitahuan)

        console.log(
            "Pemberitahuan jatuh tempo berhasil ditambahkan dengan ID:",
            pemberitahuan.id
        );
    } catch (error) {
        console.error("Error menambahkan pemberitahuan:", error);
    }

}

async function bermasalah({ data, docNB }: {
    data: INaiveBayes,
    docNB: admin.firestore.QueryDocumentSnapshot<admin.firestore.DocumentData>
}) {

    let bulanTerakhir = '';
    const firstValue = listPenghuni[listPenghuni.length - 1];
    console.log("First value:", firstValue);

    const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'Mei',
        'Jun',
        'Jul',
        'Agu',
        'Sep',
        'Nov',
        'Des',
    ];

    const jatuhTempo = data.tglJatuhTempo as admin.firestore.Timestamp;
    const bulan = months[jatuhTempo.toDate().getMonth()];
    const tahun = jatuhTempo.toDate().getFullYear().toString();

    // kode dibawah ini akan mengirim data ke field RiwayatBermasalah
    const newBermasalah: IRiwayatBermasalah = {
        dateUpload: admin.firestore.Timestamp.now(),
        tahun: tahun,
        bulan: bulan,
    };

    const riwayatBermasalah = data.riwayatBermasalah as IRiwayatBermasalah[];
    // kode dibawah ini akan mencari bulan riwayat bermasalah terakhir
    if (riwayatBermasalah.length > 0) {
        bulanTerakhir = riwayatBermasalah[riwayatBermasalah.length - 1].bulan;
        // console.log(`bulanTerakhir ${bulanTerakhir}`);
    } else {
        console.log(`bulanTerakhir kosong`);
        bulanTerakhir = '';
    }

    console.log(`bulan ${bulan}`);
    console.log(`bulanTerakhir ${bulanTerakhir}`);

    if (bulan != bulanTerakhir) {
        await queryNaiveBayes.doc(docNB.id).update({
            riwayatBermasalah: admin.firestore.FieldValue.arrayUnion(newBermasalah),
        });

        const bermasalahLength = data.riwayatBermasalah.length;
        if (bermasalahLength > 1 && bermasalahLength <= 3) {

            // kode dibawah ini akan mengirim notifikasi 
            await sendNotification({
                topic: firstValue,
                title: "Info",
                body: `Kamar ${data.idKamar.id} telah melakukan penunggakan sebanyak ${bermasalahLength} kali`,
            });
            await sendNotification({
                topic: "BaEHJHYSl22x8NX6okHa",
                title: "Info",
                body: `Kamar ${data.idKamar.id} telah melakukan penunggakan sebanyak ${bermasalahLength} kali`,
            });

            // kode dibawah ini akan mengirim data notifikasi ke tabel pemberitahuan
            const newPemberitahuan: IPemberitahuan = {
                dateUpload: admin.firestore.Timestamp.now(),
                idKamar: data.idKamar,
                deskripsi: `Kamar ${data.idKamar.id} telah melakukan penunggakan sebanyak ${bermasalahLength} kali`,
                tglJatuhTempo: data.tglJatuhTempo,
                isView: false,
            };

            try {
                const pemberitahuan = await queryPemberitahuan
                    .add(newPemberitahuan)

                console.log(
                    "Pemberitahuan bermasalah berhasil ditambahkan dengan ID:",
                    pemberitahuan.id
                );
            } catch (error) {
                console.error("Error menambahkan pemberitahuan:", error);
            }
        }
    }


}

main();

