import '../../domain/core/core.dart';

class PenghuniScreen extends GetView<PenghuniController> {
  const PenghuniScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.orange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.orange,
        title: TabButton(
          c: controller,
        ),
        automaticallyImplyLeading: false,
      ),
      body: controller.obx(
        (state) => PageView.builder(
          controller: controller.pageController,
          itemCount: 2,
          onPageChanged: (value) => controller.selectionTab.value = value,
          itemBuilder: (context, index) {
            final dataGedungA = state!
                .where((e) => e.gedung == controller.listGedung[0])
                .toList();
            final dataGedungB = state
                .where((e) => e.gedung == controller.listGedung[1])
                .toList();
            final terisiA =
                dataGedungA.where((e) => e.penghuni!.isNotEmpty).toList();
            final kosongA =
                dataGedungA.where((e) => e.penghuni!.isEmpty).toList();
            final terisiB =
                dataGedungB.where((e) => e.penghuni!.isNotEmpty).toList();
            final kosongB =
                dataGedungB.where((e) => e.penghuni!.isEmpty).toList();
            if (index == 0) {
              return PageGedung(
                gedung: dataGedungA,
                valueKosong: kosongA.length,
                valueTerisi: terisiA.length,
              );
            } else {
              return PageGedung(
                gedung: dataGedungB,
                valueKosong: kosongB.length,
                valueTerisi: terisiB.length,
              );
            }
            // if (index == 0) {
            //   return PageGedung(
            //     gedung: controller.listGedung[0],
            //   );
            // } else {
            //   return PageGedung(
            //     gedung: controller.listGedung[1],
            //   );
            // }
          },
        ),
        onEmpty: const Center(child: Text("Kosong")),
        onLoading: const LoadingState(),
        onError: (e) => Center(child: Text("pesan error : $e")),
      ),
    );
  }
}
