import '../../../domain/core/core.dart';

class FormPengeluaranScreen extends GetView<FormPengeluaranController> {
  const FormPengeluaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBatal(
        'Pengeluaran',
        Get.back,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const FormPengeluaran(),
              const WrapperImagePickerPengeluaran(),
              const Spacer(),
              Obx(
                () => ButtonPrymary.isBlack(
                  text: 'Simpan',
                  isLoading: controller.loading.value,
                  onPressed: controller.addPengeluaran,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
