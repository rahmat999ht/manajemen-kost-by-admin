import 'package:get/get.dart';

import '../../../../presentation/forms/form_kamar/controllers/form_kamar.controller.dart';

class FormKamarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormKamarController>(
      () => FormKamarController(),
    );
  }
}
