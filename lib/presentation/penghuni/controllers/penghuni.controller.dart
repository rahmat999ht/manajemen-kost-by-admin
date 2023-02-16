import '../../../domain/core/core.dart';

class PenghuniController extends GetxController {
  final RxString? cGedung = ''.obs;

  final listGedung = ["Gedung A", "Gedung B"];
  PageController pageController = PageController();
  final selectionTab = 0.obs;

  void changeSelectionTab(int value) {
    selectionTab.value = value;
    pageController.jumpToPage(value);
  }

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
