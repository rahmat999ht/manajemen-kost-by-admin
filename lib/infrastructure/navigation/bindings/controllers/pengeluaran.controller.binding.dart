import 'package:get/get.dart';

import '../../../../presentation/pengeluaran/controllers/pengeluaran.controller.dart';

class PengeluaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengeluaranController>(
      () => PengeluaranController(),
    );
  }
}
