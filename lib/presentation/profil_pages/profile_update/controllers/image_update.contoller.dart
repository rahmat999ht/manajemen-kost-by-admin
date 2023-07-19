import 'dart:developer';

import '../../../../../domain/core/core.dart';

class ImageProfileUpdateController extends GetxController
    with StateMixin<List<XFile>> {
  final formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  var imageFileList = <XFile>[];
  ImageHash? avatar;
  var avatarUpdate = <XFile>[];
  TextEditingController namaC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController jkC = TextEditingController();
  TextEditingController statusC = TextEditingController();

  late final AdminModel adminModel;
  final isLoading = false.obs;
  // Pick an image
  getImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      log("image ${image?.length ?? "Kosong"}");
      if (image != null) {
        imageFileList = [image];
        stateSuccess(imageFileList);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void removeImage(int index) {
    imageFileList.removeAt(index);
    stateSuccess(imageFileList);
  }

  @override
  void onInit() {
    stateSuccess(imageFileList);
    super.onInit();
  }

  @override
  void onClose() {
    change([], status: RxStatus.empty());
    super.onClose();
  }

  void stateSuccess(List<XFile> list) {
    change(
      list,
      status: list.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }
}
