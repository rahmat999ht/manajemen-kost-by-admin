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
    Get.lazyPut<KamarController>(
      () => KamarController(),
    );
    Get.lazyPut<JatuhTempoController>(
      () => JatuhTempoController(),
    );
    Get.lazyPut<TerdekatController>(
      () => TerdekatController(),
    );
    Get.lazyPut<ImagesPemasukanController>(
      () => ImagesPemasukanController(),
    );
  }
}
