import '../../../domain/core/core.dart';

class FormKamarScreen extends GetView<FormKamarController> {
  const FormKamarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Kamar ${controller.noKamar}',
        () {
          Get.offAllNamed(Routes.PENGHUNI);
        },
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const InformasiPenyewa(),
                SizeApp.h20,
                const InformasiFasilitas(),
                SizeApp.h20,
                const InformasiHarga(),
                SizeApp.h20,
                Obx(
                  () => ButtonPrymary.isBlack(
                    isLoading: controller.isLoading.value,
                    onPressed: controller.updateKamar,
                    text: 'Simpan',
                  ),
                ),
                SizeApp.h20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
