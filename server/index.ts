import admin from "firebase-admin"
import * as serviceAccount from './manajemen-kost.json'
import { message } from './data'
import { IKamar, INaiveBayes, IPenghuni } from "./types";

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


function main() {
    const targetId = '07 A';
    let listKamar = [];
    let listPenghuni = [];
    queryNaiveBayes.onSnapshot(
        (snapshot) => {
            snapshot.docs.forEach((docNB) => {
                const data = docNB.data() as INaiveBayes;
                if (data.idKamar.id === targetId) {
                    listKamar.push(data.idKamar);
                }
            });
            console.log('List Kamar:', listKamar);
        },
        (error) => {
            console.log('Error getting documents: ', error);
        }
    );
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