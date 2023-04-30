import '../../../../domain/core/core.dart';

class InformasiHarga extends GetView<FormKamarController> {
  const InformasiHarga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Harga Sebulan"),
            SizeApp.h14,
            TextForm.border(
              isCheck: true,
              width: SizeApp.wFull * 0.42,
              controller: controller.hargaSebulan,
              titel: "Status",
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Harga Setahun"),
            SizeApp.h14,
            TextForm.border(
              isCheck: true,
              width: SizeApp.wFull * 0.42,
              controller: controller.hargaSetahun,
              titel: "Status",
            ),
          ],
        ),
      ],
    );
  }
}
