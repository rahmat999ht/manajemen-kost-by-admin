import 'package:get/get.dart';

import '../../../../presentation/form_pengeluaran/controllers/form_pengeluaran.controller.dart';

class FormPengeluaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPengeluaranController>(
      () => FormPengeluaranController(),
    );
  }
}
