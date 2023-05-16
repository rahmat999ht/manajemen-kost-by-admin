import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class ImagesPengeluaranController extends GetxController
    with StateMixin<List<XFile>> {
  final _picker = ImagePicker();
  var imageFileList = <XFile>[];

  // Pick an image
  getImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      log("image ${image ?? "Kosong"}");
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
    change([], status: RxStatus.empty());
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
