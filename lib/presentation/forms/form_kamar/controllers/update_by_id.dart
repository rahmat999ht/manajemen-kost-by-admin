import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class UpdateByID {
  void updateKamarById({
    String? noKamar,
    Map<String, dynamic>? data,
  }) {
    UtilsApp.firebaseFirestore
        .collection(UtilsApp.kamarCollection)
        .doc(noKamar)
        .update(
          data!,
        );
  }

  void setPenghuniById({
    String? idPenghuni,
    Map<String, dynamic>? data,
  }) {
    UtilsApp.firebaseFirestore
        .collection(UtilsApp.penghuniCollection)
        .doc(idPenghuni)
        .set(data!);
  }

  void updatePenghuniById({
    String? idPenghuni,
    Map<String, dynamic>? data,
  }) {
    UtilsApp.firebaseFirestore
        .collection(UtilsApp.penghuniCollection)
        .doc(idPenghuni)
        .update(data!);
  }

  void addNaiveBayesById({
    Map<String, dynamic>? data,
  }) {
    UtilsApp.firebaseFirestore
        .collection(UtilsApp.naiveBayesCollection)
        .add(data!);
  }

  void updateNaiveBayesById({
    String? idNaiveBayes,
    Map<String, dynamic>? data,
  }) {
    UtilsApp.firebaseFirestore
        .collection(UtilsApp.naiveBayesCollection)
        .doc(idNaiveBayes)
        .update(data!);
  }
}
