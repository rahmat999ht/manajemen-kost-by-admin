import '../../../../../domain/core/core.dart';

class WrapperImageUpdateProfil extends GetView<ImageProfileUpdateController>
    with ImageState {
  const WrapperImageUpdateProfil({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageHash? image;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => imageUpdateProfilSucces(
        state!,
        controller.getImage,
      ),
      onEmpty: imageUpdateProfilEmpty(
        image,
        controller.getImage,
      ),
    );
  }
}
