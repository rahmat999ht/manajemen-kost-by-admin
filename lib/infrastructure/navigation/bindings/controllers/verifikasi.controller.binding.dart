import '../../../../domain/core/core.dart';

class VerifikasiControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiController>(
      () => VerifikasiController(),
    );
  }
}
