import '../../../domain/core/core.dart';

Future alertFormJenis({
  String? title,
  List? listValue,
  TextEditingController? textC,
}) async {
  await alertContent(
    title: title,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeApp.wFull,
        ...listValue!
            .map((e) => InkWell(
                  onTap: () {
                    textC!.text = e;

                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(' -  $e'),
                  ),
                ))
            .toList(),
      ],
    ),
  );
}
