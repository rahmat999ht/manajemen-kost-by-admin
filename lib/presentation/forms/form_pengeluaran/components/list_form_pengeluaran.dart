import '../../../../domain/core/core.dart';

class FormPengeluaran extends GetView<FormPengeluaranController> {
  const FormPengeluaran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextForm.border(
          onTap: controller.alartJenis,
          controller: controller.jenisC,
          titel: "Jenis",
          isCheck: true,
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
        ),
        SizeApp.h16,
        TextForm.border(
          controller: controller.idrC,
          titel: "IDR",
          isCheck: true,
          textInputType: TextInputType.number,
          inputFormatters: [MoneyFormatter()],
        ),
      ],
    );
  }
}
