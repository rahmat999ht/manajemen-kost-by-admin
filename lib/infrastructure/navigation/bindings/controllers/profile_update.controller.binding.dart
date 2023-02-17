import 'package:get/get.dart';

import '../../../../presentation/profile_update/controllers/profile_update.controller.dart';

class ProfileUpdateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateController>(
      () => ProfileUpdateController(),
    );
  }
}
