import '../../../domain/core/core.dart';

class FormKamarScreen extends GetView<FormKamarController> {
  const FormKamarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBatal(
        'Kamar ${controller.noKamar}',
        () {
          Get.offAllNamed(Routes.PENGHUNI);
        },
      ),
      body: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(0),
        child: Obx(
          () => Stack(
            children: [
              Padding(
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
              if (controller.isLoading.value == true)
                Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
