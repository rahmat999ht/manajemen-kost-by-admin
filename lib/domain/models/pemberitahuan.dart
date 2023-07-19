// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../core/core.dart';

class PemberitahuanModel {
  String? id;
  Timestamp? dateUpload;
  DocumentReference? idKamar;
  String? deskripsi;
  Timestamp? tglJatuhTempo;
  bool? isView;
  PemberitahuanModel({
    this.id,
    required this.dateUpload,
    required this.idKamar,
    required this.deskripsi,
    required this.tglJatuhTempo,
    required this.isView,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'idKamar': idKamar,
      'deskripsi': deskripsi,
      'tglJatuhTempo': tglJatuhTempo,
      'isView': isView,
    };
  }

  factory PemberitahuanModel.fromMapByID(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return PemberitahuanModel(
      id: id,
      dateUpload:
          map['dateUpload'] != null ? map['dateUpload'] as Timestamp : null,
      idKamar: idKamar,
      deskripsi: map['deskripsi'] != null ? map['deskripsi'] as String : null,
      tglJatuhTempo: map['tglJatuhTempo'] != null
          ? map['tglJatuhTempo'] as Timestamp
          : null,
      isView: map['isView'] != null ? map['isView'] as bool : null,
    );
  }
  factory PemberitahuanModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return PemberitahuanModel.fromMapByID(data, snapshot.id);
  }
}
