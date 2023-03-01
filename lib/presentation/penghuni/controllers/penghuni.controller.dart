import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/models/kamar.dart';

import '../../../domain/core/core.dart';

class PenghuniController extends GetxController {
  final RxString? cGedung = ''.obs;

  final listGedung = ["Gedung A", "Gedung B"];
  PageController pageController = PageController();
  final selectionTab = 0.obs;
  final loading = false.obs;

  void changeSelectionTab(int value) {
    selectionTab.value = value;
    pageController.jumpToPage(value);
  }

  Future kamar(String noKamar) async {
    loading.value = !loading.value;
    final dataKamar = await UtilsApp.firebaseFirestore
        .collection(UtilsApp.kamarCollection)
        .where(
          "no_kamar",
          isEqualTo: noKamar,
        )
        .get();
    if (dataKamar.size == 0) {
      log("data 0");
      UtilsApp.firebaseFirestore.collection(UtilsApp.kamarCollection).add(
            KamarModel.add(noKamar).toRegis(),
          );
      Get.toNamed(Routes.CALENDER);
    } else {
      Get.toNamed(Routes.CALENDER);
    }
    loading.value = !loading.value;
  }
}
