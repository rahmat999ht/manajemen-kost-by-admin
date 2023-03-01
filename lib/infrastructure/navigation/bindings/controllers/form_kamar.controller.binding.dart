import 'package:get/get.dart';

import '../../../../presentation/form_kamar/controllers/form_kamar.controller.dart';

class FormKamarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormKamarController>(
      () => FormKamarController(),
    );
  }
}
