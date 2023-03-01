import 'package:manajemen_kost_by_admin/domain/core/core.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KamarModel {
  final String? id;
  final String? lantai;
  final String? gedung;
  final List<String>? fasilitas;
  final int? sewaBulanan;
  final int? sewaTahunan;
  final List<String>? penghuni;
  KamarModel({
    this.id,
    this.lantai,
    this.gedung,
    this.fasilitas,
    this.sewaBulanan,
    this.sewaTahunan,
    this.penghuni,
  });

  factory KamarModel.add(
    String id,
  ) {
    return KamarModel(
      id: id,
      lantai: '',
      gedung: '',
      fasilitas: [],
      sewaBulanan: 0,
      sewaTahunan: 0,
      penghuni: [],
    );
  }

  Map<String, dynamic> toRegis() {
    return <String, dynamic>{
      'id': id,
      'lantai': lantai,
      'gedung': gedung,
      'fasilitas': fasilitas,
      'sewa_bulanan': sewaBulanan,
      'sewa_tahunan': sewaTahunan,
      'penghuni': penghuni,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lantai': lantai,
      'gedung': gedung,
      'fasilitas': fasilitas,
      'sewa_bulanan': sewaBulanan,
      'sewa_tahunan': sewaTahunan,
      'penghuni': penghuni,
    };
  }

  factory KamarModel.fromMap(Map<String, dynamic> map, String id) {
    return KamarModel(
      id: id,
      lantai: map['lantai'] != null ? map['lantai'] as String : null,
      gedung: map['gedung'] != null ? map['gedung'] as String : null,
      fasilitas: map['fasilitas'] != null
          ? List<String>.from((map['fasilitas'] as List<String>))
          : null,
      sewaBulanan:
          map['sewa_bulanan'] != null ? map['sewa_bulanan'] as int : null,
      sewaTahunan:
          map['sewa_tahunan'] != null ? map['sewa_tahunan'] as int : null,
      penghuni: map['penghuni'] != null
          ? List<String>.from((map['penghuni'] as List<String>))
          : null,
    );
  }

  factory KamarModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) {
    final Map<String, dynamic> data = json.data()!;
    return KamarModel.fromMap(data, json.id);
  }
}
