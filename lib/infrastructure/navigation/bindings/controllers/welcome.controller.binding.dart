import '../../../../domain/core/core.dart';

class WelcomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
  }
}
