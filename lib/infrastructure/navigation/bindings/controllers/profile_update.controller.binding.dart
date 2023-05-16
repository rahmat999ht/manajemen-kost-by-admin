import '../../../../domain/core/core.dart';

class ProfileUpdateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateController>(
      () => ProfileUpdateController(),
    );
    Get.lazyPut<ImageProfileUpdateController>(
      () => ImageProfileUpdateController(),
    );
  }
}
