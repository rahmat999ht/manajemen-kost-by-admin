import 'dart:developer';
import 'dart:io';

import '../../../../domain/core/core.dart';

class FormPengeluaranController extends GetxController {
  final methodApp = MethodApp();
  final formKey = GlobalKey<FormState>();
  final jenisC = TextEditingController();
  final idrC = TextEditingController();
  final loading = false.obs;

  void loadingState() {
    loading.value = !loading.value;
  }

  final listJenis = [
    'Air',
    'Listrik',
  ];

  Future alartJenis() async {
    await alertFormJenis(
      title: "Jenis Pengeluaran",
      listValue: listJenis,
      textC: jenisC,
    );
  }

  Future addPengeluaran() async {
    try {
      if (formKey.currentState!.validate()) {
        final dataImage = Get.find<ImagesPengeluaranController>();
        final idr = idrC.text.replaceAll('Rp', '');
        final fixIdr = idr.replaceAll(',', '');
        log(fixIdr);
        if (dataImage.imageFileList.isNotEmpty) {
          loadingState();
          final foto = await methodApp.uploadWithImage(
            File(dataImage.imageFileList.first.path),
            "${ConstansApp.idLogin}_${DateTime.now().toIso8601String()}",
            pemasukan: false,
          );
          final data = PengeluaranModel(
            foto: foto,
            jenis: jenisC.text,
            idr: int.parse(fixIdr),
            dateUpload: Timestamp.now(),
          ).toMap();
          log(data.toString());
          methodApp.addPengeluaran(data: data);
          log('berhasil');
          dataImage.removeImage(0);
          Get.offAllNamed(Routes.DASHBOARD);
          loadingState();
        } else {
          Get.snackbar('Info', "Tolong tambahkan Nota");
        }
      } else {
        Get.snackbar('Info', "Tolong isi semua form");
      }
    } catch (e) {
      Get.snackbar('Info', "Pesan Error : $e");
    }
  }
}
