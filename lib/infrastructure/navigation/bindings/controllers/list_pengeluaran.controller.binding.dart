import 'package:get/get.dart';

import '../../../../presentation/profil/pages/list_pengeluaran/controllers/list_pengeluaran.controller.dart';

class ListPengeluaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPengeluaranController>(
      () => ListPengeluaranController(),
    );
  }
}
