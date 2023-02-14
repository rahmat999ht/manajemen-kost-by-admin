import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class PenghuniController extends GetxController {
  final RxString? cGedung = ''.obs;

  final listGedung = ["Gedung A", "Gedung B"];

  Future valueField() {
    return Get.dialog(
      AlertDialog(
        title: const Text(
          'Pilih Gedung',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: listGedung
              .map(
                (e) => InkWell(
                  onTap: () {
                    cGedung?.value = e;
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(e),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  void onInit() {
    if (cGedung?.value == null) {
      cGedung?.value ?? "Gedung A";
    }
    super.onInit();
  }
}
