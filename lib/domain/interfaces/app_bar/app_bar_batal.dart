import 'package:manajemen_kost_by_admin/domain/core/core.dart';

PreferredSizeWidget appBarBatal(String title, void Function()? onTap) {
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
        onTap: onTap,
      ),
      SizeApp.w20,
    ],
  );
}
