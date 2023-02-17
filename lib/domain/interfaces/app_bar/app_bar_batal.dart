import 'package:manajemen_kost_by_admin/domain/core/core.dart';

PreferredSizeWidget appBar(String title, bool isBack) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorApp.white,
    title: Text(
      title,
      style: const TextStyle(
        color: ColorApp.blackText,
        fontSize: 16,
      ),
    ),
    automaticallyImplyLeading: false,
    actions: [
      ButtonText(
        'Batal',
        fontSize: 16,
        titleColor: ColorApp.gray,
        onTap: () {
          if (isBack == true) {
            Get.back();
          }
          Get.offAllNamed(Routes.DASHBOARD);
        },
      ),
      SizeApp.w20,
    ],
  );
}
