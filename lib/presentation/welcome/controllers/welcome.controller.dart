import 'dart:developer';

import '../../../domain/core/core.dart';

class WelcomeController extends GetxController {
  final String kelola =
      "Kelola manajemen kost Anda, hanya dengan langkah sederhana, di tangan Anda.";
  final String anda = "Anda selangkah lagi.";

  void tapStart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isStart", true);
    log("tapStart");
    log(prefs.getBool("isStart").toString());
    Get.offAndToNamed(Routes.LOGIN);
  }
}
