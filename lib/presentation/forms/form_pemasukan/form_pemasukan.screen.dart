import '../../../domain/core/core.dart';

class FormPemasukanScreen extends GetView<FormPemasukanController> {
  const FormPemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBatal(
        'Pemasukan',
        Get.back,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const FormPemasukan(),
              const WrapperImagePickerPemasukan(),
              const Spacer(),
              Obx(
                () => ButtonPrymary.isBlack(
                  isLoading: controller.loading.value,
                  text: 'Simpan',
                  onPressed: controller.addPemasukan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
