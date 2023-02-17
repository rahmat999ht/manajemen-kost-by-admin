import 'package:get/get.dart';

import '../../../../presentation/list_pemasukan/controllers/list_pemasukan.controller.dart';

class ListPemasukanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPemasukanController>(
      () => ListPemasukanController(),
    );
  }
}
