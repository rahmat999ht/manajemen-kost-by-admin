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
              const WrapperImagePicker(),
              const Spacer(),
              ButtonPrymary.isBlack(
                text: 'Simpan',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WrapperImagePicker extends GetView<ImagesPemasukanController>
    with ImageState {
  const WrapperImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => imageSuccess(
        state!,
        (index) => controller.removeImage(index),
      ),
      onEmpty: imageEmpty(controller.getImage),
    );
  }
}
