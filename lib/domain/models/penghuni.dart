import '../core/core.dart';

class PenghuniModel {
  final String? id;
  final ImageHash? image;
  final String nama;
  final String noHp;
  final String jkl;
  final String status;
  final String? peran;
  PenghuniModel({
    this.id,
    this.image,
    required this.nama,
    required this.noHp,
    required this.jkl,
    required this.status,
    this.peran,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'nama': nama,
      'noHp': noHp,
      'jkl': jkl,
      'status': status,
      'peran': peran,
    };
  }

  factory PenghuniModel.fromMap(Map<String, dynamic> map) {
    return PenghuniModel(
      image: map['image'] != null ? map['image'] as ImageHash : null,
      nama: map['nama'] as String,
      noHp: map['noHp'] as String,
      jkl: map['jkl'] as String,
      status: map['status'] as String,
      peran: map['peran'] != null ? map['peran'] as String : "Kosong",
    );
  }
  factory PenghuniModel.fromMapId(Map<String, dynamic> map, String id) {
    return PenghuniModel(
      id: id,
      image: map['image'] != null ? map['image'] as ImageHash : null,
      nama: map['nama'] as String,
      noHp: map['noHp'] as String,
      jkl: map['jkl'] as String,
      status: map['status'] as String,
      peran: map['peran'] != null ? map['peran'] as String : "Kosong",
    );
  }
  factory PenghuniModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> data,
  ) {
    Map<String, dynamic> json = data.data()!;
    return PenghuniModel.fromMapId(json, data.id);
  }
}
