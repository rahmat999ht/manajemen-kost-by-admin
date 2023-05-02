import 'dart:developer';

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

  Future<Map<String, bool>> cekAnggota(
    TextEditingController nomorPonsel,
  ) async {
    log("loading");
    var dataAnggota = await ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .withConverter<PenghuniModel>(
          fromFirestore: (snapshot, _) =>
              PenghuniModel.fromDocumentSnapshot(snapshot),
          toFirestore: (model, _) => model.toMap(),
        )
        .get();
    if (dataAnggota.size == 0) {
      return {
        "isPhoneNull": false,
        "isIdAnggotaNull": false,
      };
    }
    var isPhoneNull = dataAnggota.docs
        .where(
          (element) => element.data().noHp == nomorPonsel.text,
        )
        .toList();

    var isIdAnggotaNull = dataAnggota.docs
        .where(
          (element) => element.id == nomorPonsel.text,
        )
        .toList();

    return {
      "isPhoneNull": isPhoneNull.isNotEmpty,
      "isIdAnggotaNull": isIdAnggotaNull.isNotEmpty,
    };
  }

  void regAdmin(
    GlobalKey<FormState> formKey,
    TextEditingController nomorPonsel,
  ) async {
    try {
      if (formKey.currentState!.validate()) {
        log("mulai");

        // final cekDataAnggota = await cekAnggota(nomorPonsel);
        // if (cekDataAnggota["isPhoneNull"]!) {
        //   log("isPhoneNotNull");
        //   return;
        // }

        // if (cekDataAnggota["isIdAnggotaNull"]!) {
        //   log("isIdAnggotaNotNull");
        //   return;
        // }

        await ConstansApp.auth.verifyPhoneNumber(
          phoneNumber: nomorPonsel.text,
          verificationCompleted: (credential) {
            log("berhasil");
            Get.snackbar(
              "info",
              '${nomorPonsel.text} berhasil di daftarkan',
            );
          },
          verificationFailed: (e) {
            log("verificationFailed : ${e.message} ${e.phoneNumber}");
            Get.snackbar(
              "info",
              '${nomorPonsel.text} gagal di daftarkan',
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            log("code di kirim");
          },
          codeAutoRetrievalTimeout: (verificationId) {
            log("codeAutoRetrievalTimeout ini : $verificationId");
          },
        );
      }
    } catch (e) {
      alertInfo("error", e.toString());
    }
  }
}
