import 'dart:developer';

import '../../../../domain/core/core.dart';

class InformasiPenyewa extends GetView<FormKamarController> {
  const InformasiPenyewa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return controller.obx(
    //   (state) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.listPenyewa.length > 1)
            const Text("Informasi Penyewa"),
          ...controller.listPenyewa.mapIndexed(
            (index, e) {
              log(controller.listPenyewa.length.toString());
              // log(state!.length.toString());
              // if (state.isNotEmpty) {
              //   e[0].text = state[index].nama;
              //   e[1].text = state[index].noHp;
              //   e[2].text = state[index].jkl;
              //   e[3].text = state[index].status;
              // }
              // final e = await element;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.listPenyewa.length <= 1)
                    const Text("Informasi Penyewa"),
                  if (index > 0)
                    Column(
                      children: [
                        SizeApp.h20,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Teman Sekamar "),
                            ButtonText.isIcon(
                              "Hapus form",
                              rigtIcon: true,
                              icon: Icons.close,
                              titleColor: Colors.black,
                              iconColor: Colors.black,
                              onTap: () {
                                controller.deleteTSbyID(e);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  SizeApp.h14,
                  TextForm.border(
                    controller: e[0],
                    titel: "Nama",
                    isCheck: true,
                  ),
                  SizeApp.h14,
                  TextForm.border(
                    controller: e[1],
                    isPhone: true,
                    titel: "No. Hp",
                    isCheck: true,
                  ),
                  SizeApp.h14,
                  TextForm.border(
                    onTap: () {
                      controller.alertJkl(index);
                    },
                    controller: e[2],
                    titel: "Jkl",
                    isCheck: true,
                  ),
                  SizeApp.h14,
                  TextForm.border(
                    onTap: () {
                      controller.alertStatus(index);
                    },
                    controller: e[3],
                    titel: "Status",
                    isCheck: true,
                  ),
                ],
              );
            },
          ),
          ButtonOutline(
            onPressed: controller.addTemanSekamar,
            text: "Tambah Teman Sekamar",
          ),
        ],
      ),
    );
    // },
    //   onEmpty: const Center(child: Text("Masih Kosong")),
    //   onLoading: const LoadingState(),
    //   onError: (e) {
    //     return Center(child: Text("error : $e"));
    //   },
    // );
  }
}
