import 'dart:developer';

import '../../../domain/core/core.dart';

class ItemLantai extends GetView<PenghuniController> {
  const ItemLantai(
    this.title, {
    super.key,
    required this.data,
    required this.gedung,
  });

  final String title;
  final List<String> data;
  final String gedung;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "    $title",
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.blueText,
          ),
        ),
        SizeApp.h8,
        GridView.builder(
          padding: const EdgeInsets.all(0),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 85,
            childAspectRatio: 1,
            crossAxisSpacing: 22,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return Obx(
              () => CardTapKamar(
                isLoading: controller.loading.value,
                onTap: () {
                  controller.addKamar(
                    data[index],
                    title,
                    gedung,
                  );
                  log(data[index], name: "kamar");
                },
                noKamar: data[index],
              ),
            );
          },
        ),
      ],
    );
  }
}
