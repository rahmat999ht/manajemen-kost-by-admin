import { firestore } from "firebase-admin";

export type MessageProps = {
    topic: string;
    body: string;
    title: string;
    sound?: string;
    priority?: "high" | "normal";
  };

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
    idKamar: DocumentReference;
    riwayatPembayaran: IRiwayatPembayaran[];
    statusKamar: boolean;
    terisi: boolean
    tglJatuhTempo: ITimestamp;
}

export interface IRiwayatPembayaran {
    bulan: string | null;
    dateUpload: ITimestamp;
    isBermasalah: boolean;
    isTahunan: boolean;
    sewaBulanan: number | null;
    sewaTahunan: number | null;
    tahun: string | null;
}

export interface IKamar {
    fasilitas: string[]
    gedung: string
    lantai: string
    noKamar: string
    penghuni: DocumentReference[]
    sewa_bulanan: number
    sewa_tahunan: number
    tglSewa: ITimestamp
}


export interface IPemberitahuan {
    dateUpload: ITimestamp
    idKamar: DocumentReference
    deskripsi: string
    tglJatuhTempo: ITimestamp
    isView: boolean
}


export type ITimestamp = firestore.Timestamp
export const TimestampNow = firestore.Timestamp.now()
export const Timestamp = firestore.Timestamp
export type DocumentReference = firestore.DocumentReference

