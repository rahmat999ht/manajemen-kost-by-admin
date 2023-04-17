import '../core/core.dart';

class PenghuniModel {
  final String? id;
  final String nama;
  final String noHp;
  final String jkl;
  final String status;
  PenghuniModel({
    this.id,
    required this.nama,
    required this.noHp,
    required this.jkl,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'noHp': noHp,
      'jkl': jkl,
      'status': status,
    };
  }

  factory PenghuniModel.fromMap(Map<String, dynamic> map) {
    return PenghuniModel(
      nama: map['nama'] as String,
      noHp: map['noHp'] as String,
      jkl: map['jkl'] as String,
      status: map['status'] as String,
    );
  }
  factory PenghuniModel.fromMapId(Map<String, dynamic> map, String id) {
    return PenghuniModel(
      id: id,
      nama: map['nama'] as String,
      noHp: map['noHp'] as String,
      jkl: map['jkl'] as String,
      status: map['status'] as String,
    );
  }
  factory PenghuniModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> data,
  ) {
    Map<String, dynamic> json = data.data()!;
    return PenghuniModel.fromMapId(json, data.id);
  }
}
