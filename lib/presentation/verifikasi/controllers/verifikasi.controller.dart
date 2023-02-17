import 'dart:developer';

import '../../../domain/core/core.dart';

class VerifikasiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final String valueSubTitle =
      'Kami telah mengirim kode verifikasi \nke nomor ponsel kamu';
  final RxBool isLoading = false.obs;
  final String verificationId = Get.arguments["verificationId"] as String;
  final bool isRegis = Get.arguments["isRegis"] as bool;

  void isLoadingChange() {
    isLoading.value = !isLoading.value;
  }

  final listOtp = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  Future<void> tapVerifikasi() async {
    isLoadingChange();
    try {
      final prefs = await SharedPreferences.getInstance();
      String smsCode = '';
      for (var element in listOtp) {
        smsCode += element.text;
      }
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      String userId = "";
      if (isRegis) {
        final dataUser = await UtilsApp.firebaseFirestore
            .collection(UtilsApp.adminCollection)
            .add(
              Get.arguments["dataJsonRegis"],
            );
        userId = dataUser.id;
      } else {
        userId = Get.arguments["user_id"];
      }
      // Sign the user in (or link) with the credential
      UserCredential userCredential =
          await UtilsApp.auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        prefs.setString("user_id", userId);
        Get.offAllNamed("${Routes.DASHBOARD}/$userId");
      } else {
        Get.defaultDialog(middleText: "kosong");
      }
    } catch (e) {
      log("error", error: e);
      alertInfo("error", e.toString());
    }
    isLoadingChange();
  }

  void tapKirimUlang() {
    log("tapKirimUlang");
  }
}
