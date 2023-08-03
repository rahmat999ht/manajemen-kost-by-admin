// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class TerdekatModel extends NaiveBayesModel {
  TerdekatModel({
    super.idNaiveBayes,
    required super.tglJatuhTempo,
    required super.idKamar,
    super.statusKamar,
    super.riwayatBersamalah,
    super.terisi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tglJatuhTempo': tglJatuhTempo,
      'idKamar': idKamar,
      'statusKamar': statusKamar,
      'riwayatBersamalah': riwayatBersamalah,
      'terisi': terisi,
    };
  }

  factory TerdekatModel.fromMapByID(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return TerdekatModel(
      idNaiveBayes: id,
      tglJatuhTempo: map['tglJatuhTempo'] != null
          ? map['tglJatuhTempo'] as Timestamp
          : null,
      idKamar: idKamar,
      statusKamar:
          map['statusKamar'] != null ? map['statusKamar'] as bool : null,
      // riwayatBersamalah: map['riwayatBersamalah'] ?? [],
      terisi: map['terisi'] != null ? map['terisi'] as bool : null,
    );
  }

  factory TerdekatModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return TerdekatModel.fromMapByID(data, snapshot.id);
  }
}
