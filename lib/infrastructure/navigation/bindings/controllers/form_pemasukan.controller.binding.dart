import 'package:get/get.dart';

import '../../../../presentation/forms/form_pemasukan/controllers/form_pemasukan.controller.dart';

class FormPemasukanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPemasukanController>(
      () => FormPemasukanController(),
    );
  }
}
