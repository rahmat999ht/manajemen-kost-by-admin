import '../../../domain/core/core.dart';

class DashboardController extends GetxController
//  with StateMixin
{
  final RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions = <Widget>[];
  bool toogle = true;
  final isLoading = true.obs;

  void toPenghuni() {
    Get.toNamed(Routes.PENGHUNI);
  }

  void toPemasukan() {
    Get.toNamed(Routes.PEMASUKAN);
  }

  void toPengeluaran() {
    Get.toNamed(Routes.PENGELUARAN);
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      selectedIndex.value = Get.arguments["selectedIndex"] ?? 0;
    }
    widgetOptions = [
      const HomeScreen(),
      const CalenderScreen(),
      const ListPenghuniScreen(),
      const ProfilScreen(),
    ];
    super.onInit();
  }
}
