import 'package:get/get.dart';

import '../../../../presentation/forms/form_pengeluaran/controllers/form_pengeluaran.controller.dart';

class FormPengeluaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPengeluaranController>(
      () => FormPengeluaranController(),
    );
  }
}
