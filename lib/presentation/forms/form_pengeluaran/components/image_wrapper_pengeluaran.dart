import '../../../../domain/core/core.dart';

class WrapperImagePickerPengeluaran extends GetView<ImagesPengeluaranController>
    with ImageState {
  const WrapperImagePickerPengeluaran({Key? key}) : super(key: key);

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
