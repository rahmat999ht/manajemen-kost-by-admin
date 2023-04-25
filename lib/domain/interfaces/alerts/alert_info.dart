import 'package:get/get.dart';

alertInfo(
  String title,
  String middleText,
) {
  Get.defaultDialog(
    title: title,
    middleText: middleText,
    radius: 8,
  );
}
