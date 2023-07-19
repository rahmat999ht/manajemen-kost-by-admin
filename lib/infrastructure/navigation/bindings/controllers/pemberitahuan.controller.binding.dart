import 'package:get/get.dart';

import '../../../../presentation/pemberitahuan/controllers/pemberitahuan.controller.dart';

class PemberitahuanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemberitahuanController>(
      () => PemberitahuanController(),
    );
  }
}
