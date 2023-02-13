import 'dart:convert';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoKamarModel {
  String id;
  List<String>? lantai1;
  List<String>? lantai2;
  List<String>? lantai3;
  List<String>? lantai4;
  NoKamarModel({
    required this.id,
    required this.lantai1,
    required this.lantai2,
    required this.lantai3,
    required this.lantai4,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Lantai 1': lantai1,
      'Lantai 2': lantai2,
      'Lantai 3': lantai3,
      'Lantai 4': lantai4,
    };
  }

  factory NoKamarModel.fromMap(String id, Map<String, dynamic> map) {
    return NoKamarModel(
      id: id,
      lantai1: map['Lantai 1'] == null
          ? []
          : List<String>.from(
              (map['Lantai 1']),
            ),
      lantai2: map['Lantai 2'] == null
          ? []
          : List<String>.from(
              (map['Lantai 2']),
            ),
      lantai3: map['Lantai 3'] == null
          ? []
          : List<String>.from(
              (map['Lantai 3']),
            ),
      lantai4: map['Lantai 4'] == null
          ? []
          : List<String>.from(
              (map['Lantai 4']),
            ),
    );
  }

  String toDocumentSnapshot() => json.encode(toMap());

  factory NoKamarModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    Map<String, dynamic> json = data.data()!;
    return NoKamarModel.fromMap(data.id, json);
  }
}
