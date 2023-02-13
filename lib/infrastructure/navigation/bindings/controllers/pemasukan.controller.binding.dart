import 'package:get/get.dart';

import '../../../../presentation/pemasukan/controllers/pemasukan.controller.dart';

class PemasukanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemasukanController>(
      () => PemasukanController(),
    );
  }
}
