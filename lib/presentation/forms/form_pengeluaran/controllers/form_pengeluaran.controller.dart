import 'dart:developer';
import 'dart:io';

import '../../../../domain/core/core.dart';

class FormPengeluaranController extends GetxController {
  final methodApp = MethodApp();
  final formKey = GlobalKey<FormState>();
  final jenisC = TextEditingController();
  final idrC = TextEditingController();

  final listJenis = [
    'Air',
    'Listrik',
  ];

  Future alartJenis() async {
    await alertFormJenis(
      title: "Jenis Pemasukan",
      listValue: listJenis,
      textC: jenisC,
    );
  }

  Future addPengeluaran() async {
    try {
      if (formKey.currentState!.validate()) {
        final dataImage = Get.find<ImagesPengeluaranController>();
        if (dataImage.imageFileList.isNotEmpty) {
          final foto = await methodApp.uploadWithImage(
            File(dataImage.imageFileList.first.path),
            "${ConstansApp.idLogin}_${DateTime.now().toIso8601String()}",
            pemasukan: false,
          );
          final data = PengeluaranModel(
            foto: foto,
            jenis: jenisC.text,
            idr: int.parse(idrC.text),
            dateUpload: Timestamp.now(),
          ).toMap();
          log(data.toString());
          methodApp.addPengeluaran(data: data);
          log('berhasil');
          dataImage.removeImage(0);
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar('Info', "Tolong tambahkan Image");
        }
      } else {
        Get.snackbar('Info', "Tolong isi semua form");
      }
    } catch (e) {
      Get.snackbar('Info', "Pesan Error : $e");
    }
  }
}
