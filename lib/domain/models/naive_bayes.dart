// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class NaiveBayesModel {
  final Timestamp? tglJatuhTempo;
  final DocumentReference? idKamar;
  final bool? statusKamar;
  final List<String>? riwayatPembayaran;

  NaiveBayesModel({
    required this.tglJatuhTempo,
    this.idKamar,
    this.statusKamar,
    this.riwayatPembayaran,
  });

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'tglJatuhTempo': tglJatuhTempo,
  //     'idKamar': idKamar,
  //     'statusKamar': statusKamar,
  //     'riwayatPembayaran': riwayatPembayaran,
  //   };
  // }

  // toDocumentSnapshot(id, data) {
  //   return ConstansApp.firebaseFirestore
  //       .collection(ConstansApp.naiveBayesCollection)
  //       .doc(id)
  //       .set(data)
  //       .then(
  //     (_) {
  //       return ConstansApp.firebaseFirestore
  //           .collection(ConstansApp.naiveBayesCollection)
  //           .doc(id)
  //           .get();
  //     },
  //   );
  // }

  factory NaiveBayesModel.fromMap(Map<String, dynamic> map) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return NaiveBayesModel(
      tglJatuhTempo: map['tglJatuhTempo'] != null
          ? map['tglJatuhTempo'] as Timestamp
          : null,
      idKamar: idKamar,
      statusKamar:
          map['statusKamar'] != null ? map['statusKamar'] as bool : null,
      // riwayatPembayaran: map['riwayatPembayaran'] ?? [],
    );
  }
  factory NaiveBayesModel.fromMapByID(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return NaiveBayesModel(
      tglJatuhTempo: map['tglJatuhTempo'] != null
          ? map['tglJatuhTempo'] as Timestamp
          : null,
      idKamar: idKamar,
      statusKamar:
          map['statusKamar'] != null ? map['statusKamar'] as bool : null,
      // riwayatPembayaran: map['riwayatPembayaran'] ?? [],
    );
  }

  factory NaiveBayesModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return NaiveBayesModel.fromMapByID(data, snapshot.id);
  }
}
