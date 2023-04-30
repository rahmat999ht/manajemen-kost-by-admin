import 'dart:developer';

import '../../../domain/core/core.dart';

class PenghuniController extends GetxController {
  // final RxString? cGedung = ''.obs;

  final listGedung = ["Gedung A", "Gedung B"];
  PageController pageController = PageController();
  final selectionTab = 0.obs;
  final loading = false.obs;

  void changeSelectionTab(int value) {
    selectionTab.value = value;
    pageController.jumpToPage(value);
  }

  Future addKamar(String noKamar, String lantai, String gedung) async {
    loading.value = !loading.value;
    final dataKamar = await ConstansApp.firebaseFirestore
        .collection(ConstansApp.kamarCollection)
        .doc(noKamar)
        .get();
    if (!dataKamar.exists) {
      log("data 0");
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.kamarCollection)
          .doc(noKamar)
          .set(
            KamarModel.add(
              noKamar,
              lantai,
              gedung,
            ).toMap(),
          );
    }
    Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        Get.offAllNamed(
          Routes.FORM_KAMAR,
          arguments: noKamar,
        );
        loading.value = !loading.value;
      },
    );
  }
}
