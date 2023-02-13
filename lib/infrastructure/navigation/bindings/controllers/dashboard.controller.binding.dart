import '../../../../domain/core/core.dart';

class DashboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
      DashboardController(),
      permanent: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CalenderController>(
      () => CalenderController(),
    );
    Get.lazyPut<ListPenghuniController>(
      () => ListPenghuniController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
