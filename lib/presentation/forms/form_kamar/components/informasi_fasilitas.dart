import '../../../../domain/core/core.dart';

class InformasiFasilitas extends GetView<FormKamarController> {
  const InformasiFasilitas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Informasi Kamar"),
          ...controller.listFasilitas.map(
            (e) => Column(
              children: [
                SizeApp.h14,
                TextForm.border(
                  controller: e,
                  titel: "Fasilitas",
                  isCheck: true,
                  suffixIcon: controller.listFasilitas.length > 2
                      ? InkWell(
                          onTap: () {
                            controller.deleteFasilitas(e);
                          },
                          child: const Icon(Icons.close),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
          ButtonOutline(
            onPressed: controller.addFasilitas,
            text: "Tambah Fasilitas",
          ),
        ],
      ),
    );
  }
}
