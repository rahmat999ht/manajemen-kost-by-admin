import '../../../../../domain/core/core.dart';

class ProfilController extends GetxController {
  final listItem = <String>['Personal details', 'Pemasukan', 'Pengeluaran'];

  var listAssetsItem = [
    Assets.person,
    Assets.pemasukan2,
    Assets.pengeluaran2,
  ];

  // final AdminModel? admin = null;
  void tapPersonalDetails() {}

  void tapPemasukan() {
    Get.offAllNamed(Routes.LIST_PEMASUKAN);
  }

  void tapPengeluaran() {
    Get.offAllNamed(Routes.LIST_PENGELUARAN);
  }

  void tapTentang() {
    Get.offNamed(Routes.TENTANG_APP);
  }

  void tapLogOut() {  }
}
