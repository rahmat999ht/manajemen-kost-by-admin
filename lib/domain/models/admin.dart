// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../core/core.dart';

class AdminModel {
  final String? id;
  final ImageHash? foto;
  final String? nama;
  final String? jk;
  final String? status;
  final String? noHp;

  AdminModel({
    this.id,
    this.foto,
    this.nama = '',
    this.jk = '',
    this.status = '',
    this.noHp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foto': foto?.toJson(),
      'nama': nama,
      'jk': jk,
      'status': status,
      'no_hp': noHp,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map, String id) {
    return AdminModel(
      id: id,
      foto: map['foto'] != null
          ? ImageHash.fromJson(map['foto'] as Map<String, dynamic>)
          : null,
      nama: map['nama'] != null ? map['nama'] as String : null,
      jk: map['jk'] != null ? map['jk'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      noHp: map['no_hp'] != null ? map['no_hp'] as String : null,
    );
  }

  factory AdminModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> data,
  ) {
    Map<String, dynamic> json = data.data()!;
    return AdminModel.fromMap(json, data.id);
  }
}
