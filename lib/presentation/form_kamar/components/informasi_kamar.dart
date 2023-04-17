import '../../../domain/core/core.dart';

class InformasiKamar extends GetView<FormKamarController> {
  const InformasiKamar({
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
                  suffixIcon: controller.listFasilitas.length > 2
                      ? InkWell(
                          onTap: () {
                            controller.deleteInfoKamar(e);
                          },
                          child: const Icon(Icons.close),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
          ButtonOutline(
            onPressed: controller.addInfoKamar,
            text: "Tambah Fasilitas",
          ),
        ],
      ),
    );
  }
}
