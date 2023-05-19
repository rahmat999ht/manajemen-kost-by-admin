// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../core/core.dart';

class PengeluaranModel {
  final String? id;
  final Timestamp dateUpload;
  final ImageHash? foto;
  final String jenis;
  final int idr;
  PengeluaranModel({
    this.id,
    required this.dateUpload,
    required this.foto,
    required this.jenis,
    required this.idr,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'foto': foto!.toJson(),
      'jenis': jenis,
      'idr': idr,
    };
  }

  factory PengeluaranModel.fromMapById(Map<String, dynamic> map, String id) {
    return PengeluaranModel(
      id: id,
      dateUpload: map['dateUpload'] as Timestamp,
      foto: map['foto'] != null
          ? ImageHash.fromJson(map['foto'] as Map<String, dynamic>)
          : null,
      jenis: map['jenis'] as String,
      idr: map['idr'] as int,
    );
  }

  factory PengeluaranModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PengeluaranModel.fromMapById(data, snapshot.id);
  }
}
