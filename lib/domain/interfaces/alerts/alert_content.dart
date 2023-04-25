import '../../core/core.dart';

alertContent({
  String? title,
  Widget? content,
}) {
  Get.defaultDialog(
    title: title!,
    middleText: '',
    radius: 8,
    content: content,
  );
}
