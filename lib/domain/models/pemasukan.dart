// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class PemasukanModel {
  final String? id;
  final Timestamp dateUpload;
  final ImageHash foto;
  final String jenis;
  final int idr;
  final String waktu;
  final DocumentReference idKamar;
  final DocumentReference idLogin;
  PemasukanModel({
    this.id,
    required this.dateUpload,
    required this.foto,
    required this.jenis,
    required this.idr,
    required this.waktu,
    required this.idKamar,
    required this.idLogin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'foto': foto,
      'jenis': jenis,
      'idr': idr,
      'waktu': waktu,
      'idKamar': idKamar,
      'idLogin': idLogin,
    };
  }

  factory PemasukanModel.fromMapById(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    final dataPenghuni = map['idLogin'] as DocumentReference;
    DocumentReference<AdminModel> idAdmin = dataPenghuni.withConverter(
      fromFirestore: (snapshot, options) =>
          AdminModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return PemasukanModel(
      id: id,
      dateUpload: map['dateUpload'] as Timestamp,
      foto: map['foto'] as ImageHash,
      jenis: map['jenis'] as String,
      idr: map['idr'] as int,
      waktu: map['waktu'] as String,
      idKamar: idKamar,
      idLogin: idAdmin,
    );
  }

  factory PemasukanModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PemasukanModel.fromMapById(data, snapshot.id);
  }
}
