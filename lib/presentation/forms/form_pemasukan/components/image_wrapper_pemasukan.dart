import '../../../../domain/core/core.dart';

class WrapperImagePickerPemasukan extends GetView<ImagesPemasukanController>
    with ImageState {
  const WrapperImagePickerPemasukan({Key? key}) : super(key: key);

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
