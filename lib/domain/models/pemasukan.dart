// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class PemasukanModel {
  final String? id;
  final Timestamp dateUpload;
  final ImageHash? foto;
  final String jenis;
  final int idr;
  final DocumentReference idKamar;
  final DocumentReference idAdmin;
  PemasukanModel({
    this.id,
    required this.dateUpload,
    required this.foto,
    required this.jenis,
    required this.idr,
    required this.idKamar,
    required this.idAdmin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'foto': foto!.toJson(),
      'jenis': jenis,
      'idr': idr,
      'idKamar': idKamar,
      'idAdmin': idAdmin,
    };
  }

  Map<String, dynamic> toMapNoImage() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'foto': null,
      'jenis': jenis,
      'idr': idr,
      'idKamar': idKamar,
      'idAdmin': idAdmin,
    };
  }

  factory PemasukanModel.fromMapById(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    final dataLogin = map['idAdmin'] as DocumentReference;
    DocumentReference<AdminModel> idAdmin = dataLogin.withConverter(
      fromFirestore: (snapshot, options) =>
          AdminModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return PemasukanModel(
      id: id,
      dateUpload: map['dateUpload'] as Timestamp,
      foto: ImageHash.fromJson(map['foto'] as Map<String, dynamic>),
      jenis: map['jenis'] as String,
      idr: map['idr'] as int,
      idKamar: idKamar,
      idAdmin: idAdmin,
    );
  }

  factory PemasukanModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PemasukanModel.fromMapById(data, snapshot.id);
  }
}
