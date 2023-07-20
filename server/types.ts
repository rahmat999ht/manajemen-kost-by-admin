import { firestore } from "firebase-admin";

export interface IPenghuni {
    image: string | null;
    isAktif: boolean;
    jkl: "Laki-Laki" | "Perempuan";
    nama: string;
    noHp: string;
    peran: string;
    status: string;
}

export interface INaiveBayes {
    idKamar: firestore.DocumentReference;
    riwayatPembayaran: IRiwayatPembayaran[];
    statusKamar: boolean;
    terisi: boolean
    tglJatuhTempo: firestore.Timestamp;
}

export interface IRiwayatPembayaran {
    bulan: string | null;
    dateUpload: firestore.Timestamp;
    isBermasalah: boolean;
    isTahunan: string | null;
    sewaBulanan: string | null;
    sewaTahunan: string | null;
    tahun: string | null;
}

export interface IKamar {
    fasilitas: string[]
    gedung: string
    lantai: string
    noKamar: string
    penghuni: firestore.DocumentReference[]
    sewa_bulanan: number
    sewa_tahunan: number
    tglSewa: firestore.Timestamp
}


export interface IPemberitahuan {
    dateUpload: firestore.Timestamp
    idKamar: firestore.DocumentReference
    deskripsi: string
    tglJatuhTempo: firestore.Timestamp
    isView: boolean
}

