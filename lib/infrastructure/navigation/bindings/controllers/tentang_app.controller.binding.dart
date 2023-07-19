import 'package:get/get.dart';

import '../../../../presentation/profil/pages/tentang_app/controllers/tentang_app.controller.dart';

class TentangAppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TentangAppController>(
      () => TentangAppController(),
    );
  }
}
