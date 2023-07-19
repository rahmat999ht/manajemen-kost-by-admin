import 'dart:developer';

import '../../../domain/core/core.dart';

class ProfilController extends GetxController {
  final methodApp = MethodApp();
  final listItem = <String>[
    'Personal details',
    'Pemasukan',
    'Pengeluaran',
  ];

  var listAssetsItem = [
    Assets.person,
    Assets.pemasukan2,
    Assets.pengeluaran2,
  ];

  void tapPersonalDetails(AdminModel admin) {
    Get.toNamed(
      Routes.PROFILE_UPDATE,
      arguments: admin,
    );
  }

  void tapPemasukan() {
    Get.toNamed(Routes.LIST_PEMASUKAN);
  }

  void tapPengeluaran() {
    Get.toNamed(Routes.LIST_PENGELUARAN);
  }

  void tapTentang() {
    Get.toNamed(Routes.TENTANG_APP);
  }

  Future alertLogOut() async {
    await alertActions(
      'Peringatan',
      'apakah anda yakin ingin log-out',
      [
        // const Spacer(),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: tapLogOut,
          child: const Text('Ya'),
        ),
      ],
    );
  }

  Future tapLogOut() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", '');
    String? isId = prefs.getString("user_id") ?? '';
    log(isId);
  }
}
