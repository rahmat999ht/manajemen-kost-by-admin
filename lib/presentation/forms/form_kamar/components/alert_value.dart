import '../../../../domain/core/core.dart';

Future alertValueFormKamar({
  String? title,
  List? listValue,
  RxList<List<TextEditingController>>? listController,
  int? index,
  int? item,
}) async {
  return await alertContent(
    title: title!,
    content: Column(
      children: listValue!
          .map(
            (e) => InkWell(
              onTap: () {
                final data = listController![index!];
                final fixData = data[item!];
                fixData.text = e;
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
