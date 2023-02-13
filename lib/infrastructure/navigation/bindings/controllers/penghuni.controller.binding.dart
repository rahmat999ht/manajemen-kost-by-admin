import 'package:get/get.dart';

import '../../../../presentation/penghuni/controllers/penghuni.controller.dart';

class PenghuniControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenghuniController>(
      () => PenghuniController(),
    );
  }
}
