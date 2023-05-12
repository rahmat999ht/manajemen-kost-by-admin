import '../../../../domain/core/core.dart';

Future alertFormKamar({
  String? title,
  List<KamarModel>? listValue,
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
                    textC!.text = e.id!;
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' -  ${e.id}',
                    ),
                  ),
                ))
            .toList(),
      ],
    ),
  );
}
