import 'dart:developer';

import 'package:simple_grouped_listview/simple_grouped_listview.dart';

import '../../../domain/core/core.dart';

class ListLantai extends GetView<PenghuniController> {
  const ListLantai({
    super.key,
    // required this.isStream,
    required this.data,
  });

  // final NoKamarModel data;
  // final bool isStream;
  final List<KamarModel>? data;

  @override
  Widget build(BuildContext context) {
    return GroupedListView.grid(
      controller: ScrollController(),
      items: data!,
      itemGrouper: (KamarModel i) => i.lantai,
      headerBuilder: (context, lantai) => header(lantai),
      gridItemBuilder: (
        context,
        int countInGroup,
        int itemIndexInGroup,
        KamarModel item,
        int itemIndexInOriginalList,
      ) =>
          Obx(
        () => CardTapKamar(
          isLoading: controller.loading.value,
          penghuni: data![itemIndexInOriginalList].penghuni,
          onTap: () {
            controller.addKamar(
              '${item.noKamar}',
            );
            log('${item.noKamar}', name: "kamar");
            log(
              '${data![itemIndexInOriginalList].penghuni!.isEmpty}',
              name: "kamar",
            );
          },
          noKamar: '${item.noKamar}',
        ),
      ),
      crossAxisCount: 4,
      itemsAspectRatio: 1,
      crossAxisSpacing: 22,
      mainAxisSpacing: 16,
    );
  }

  Column header(String? lantai) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeApp.h16,
        Text(
          "    $lantai",
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.blueText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizeApp.h8,
        SizeApp.wFull,
      ],
    );
  }

  // SingleChildScrollView value() {
  //   return SingleChildScrollView(
  //     child: isStream
  //         ? Column(
  //             children: [
  //               ItemLantai(
  //                 "Lantai 1",
  //                 data: data.lantai1!,
  //                 gedung: data.id,
  //               ),
  //               SizeApp.h18,
  //               ItemLantai(
  //                 "Lantai 2",
  //                 data: data.lantai2!,
  //                 gedung: data.id,
  //               ),
  //               SizeApp.h18,
  //               ItemLantai(
  //                 "Lantai 3",
  //                 data: data.lantai3!,
  //                 gedung: data.id,
  //               ),
  //               SizeApp.h18,
  //               ItemLantai(
  //                 "Lantai 4",
  //                 data: data.lantai4!,
  //                 gedung: data.id,
  //               ),
  //             ],
  //           )
  //         : SizedBox(
  //             height: Get.height - 290,
  //             width: Get.width,
  //             child: const LoadingState(),
  //           ),
  //   );
  // }
}
