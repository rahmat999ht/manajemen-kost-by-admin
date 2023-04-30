import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class MhetodApp {
  void updateKamarById({
    String? noKamar,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.kamarCollection)
        .doc(noKamar)
        .update(
          data!,
        );
  }

  void setPenghuniById({
    String? idPenghuni,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idPenghuni)
        .set(data!);
  }

  void updatePenghuniById({
    String? idPenghuni,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idPenghuni)
        .update(data!);
  }

  void addNaiveBayesById({
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.naiveBayesCollection)
        .add(data!);
  }

  void updateNaiveBayesById({
    String? idNaiveBayes,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.naiveBayesCollection)
        .doc(idNaiveBayes)
        .update(data!);
  }

  DocumentReference<NoKamarModel> noKamar(String id) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.noKamarCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              NoKamarModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  DocumentReference<AdminModel> admin(String id) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.adminCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              AdminModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  DocumentReference<PenghuniModel> penghuni(String idUser) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idUser)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                PenghuniModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }

  DocumentReference<KamarModel> kamar(String idKamar) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.kamarCollection)
        .doc(idKamar)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                KamarModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }
}
