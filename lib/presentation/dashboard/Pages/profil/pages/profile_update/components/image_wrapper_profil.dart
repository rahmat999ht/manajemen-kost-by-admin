import '../../../../../../../domain/core/core.dart';

class WrapperImageUpdateProfil extends GetView<ImageUpdateController>
    with ImageState {
  const WrapperImageUpdateProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => imageUpdateProfilSucces(
        state!,
        controller.getImage,
      ),
      onEmpty: imageUpdateProfilEmpty(
        controller.avatar,
        controller.getImage,
      ),
    );
  }
}
