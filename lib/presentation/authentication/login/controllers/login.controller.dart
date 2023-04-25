import 'dart:developer';

import '../../../../domain/core/core.dart';

class LoginController extends GetxController {
  final nomorPonsel = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;

  void isLoadingChange() {
    isLoading.value = !isLoading.value;
  }

  Future<void> tapSelanjutnya() async {
    isLoadingChange();
    try {
      if (formKey.currentState!.validate()) {
        log("mulai");
        final dataUser = await UtilsApp.firebaseFirestore
            .collection(UtilsApp.adminCollection)
            .where(
              "no_hp",
              isEqualTo: nomorPonsel.text,
            )
            .get();
        log("message");
        if (dataUser.size == 0) {
          log("data 0");
          alertActions(
            'Info',
            'Nomor anda belum terdaftar',
            [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  Get.back(result: false);
                  // Get.back();
                },
              ),
            ],
          );
          isLoadingChange();
          return;
        }
        log("try : ${dataUser.docs.first.id}");
        await UtilsApp.auth.verifyPhoneNumber(
          phoneNumber: nomorPonsel.text,
          verificationCompleted: (credential) {},
          verificationFailed: (e) {
            log("verificationFailed : ${e.message} ${e.phoneNumber}");
          },
          codeSent: (String verificationId, int? resendToken) {
            log("codeSent");
            isLoadingChange();
            Get.toNamed(
              Routes.VERIFIKASI,
              arguments: {
                "verificationId": verificationId,
                "isRegis": false,
                "user_id": dataUser.docs.first.id,
              },
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {
            log("codeAutoRetrievalTimeout ini : $verificationId");
          },
        );
      }
    } catch (e) {
      isLoadingChange();
      log(e.toString());
      alertInfo("error", e.toString());
    }
  }

  void tapRegAdmin() async {
    try {
      isLoadingChange();
      log("loading");

      if (formKey.currentState!.validate()) {
        log("formKey");
        await UtilsApp.auth.verifyPhoneNumber(
          phoneNumber: nomorPonsel.text,
          verificationCompleted: (credential) {},
          verificationFailed: (e) {
            log("verificationFailed : ${e.message} ${e.phoneNumber}");
            alertActions(
              'Info',
              'Anda gagal mendaftar',
              [
                TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Get.back(result: false);
                    Get.back();
                  },
                ),
              ],
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            log("codeSent");
            isLoadingChange();
            // .then((value) {
            Get.toNamed(
              Routes.VERIFIKASI,
              arguments: {
                "verificationId": verificationId,
                "isRegis": true,
                "dataJsonRegis": AdminModel(
                  nama: "yayat",
                  noHp: nomorPonsel.text,
                ).toMap(),
              },
            );
            // });
          },
          codeAutoRetrievalTimeout: (verificationId) {
            log("codeAutoRetrievalTimeout ini : $verificationId");
          },
        );
      }
    } catch (e) {
      isLoadingChange();
      alertInfo("error", e.toString());
    }
  }
}
