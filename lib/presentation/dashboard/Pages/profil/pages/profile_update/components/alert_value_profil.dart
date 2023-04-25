import '../../../../../../../domain/core/core.dart';

Future alertValueProfil({
  final String? title,
  final List? listValue,
  final TextEditingController? textC,
}) {
  return alertContent(
    title: title!,
    content: Column(
      children: listValue!
          .map(
            (e) => InkWell(
              onTap: () {
                textC!.text = e;
                Get.back();
              },
              child: Card(
                color: ColorApp.grayForm,
                child: SizedBox(
                  height: 30,
                  width: Get.width,
                  child: Center(child: Text(e)),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
