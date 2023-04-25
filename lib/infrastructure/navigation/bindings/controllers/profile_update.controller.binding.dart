import 'package:get/get.dart';

import '../../../../presentation/dashboard/Pages/profil/pages/profile_update/controllers/profile_update.controller.dart';

class ProfileUpdateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateController>(
      () => ProfileUpdateController(),
    );
  }
}
