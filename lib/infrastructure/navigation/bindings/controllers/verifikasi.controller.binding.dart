import 'package:get/get.dart';

import '../../../../presentation/verifikasi/controllers/verifikasi.controller.dart';

class VerifikasiControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiController>(
      () => VerifikasiController(),
    );
  }
}
