import 'dart:developer';
import 'dart:io';

import '../../../../../domain/core/core.dart';

class ProfileUpdateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController namaC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController jkC = TextEditingController();
  TextEditingController statusC = TextEditingController();
  final methodApp = MethodApp();
  final listJK = <String>[
    'Laki-laki',
    'Perempuan',
  ];

  late final AdminModel adminModel;
  final isLoading = false.obs;

  void initLoading() {
    isLoading.value = !isLoading.value;
  }

  Future updateProfil() async {
    try {
      if (formKey.currentState!.validate()) {
        final dataImage = Get.find<ImageProfileUpdateController>();
        if (dataImage.imageFileList.isNotEmpty || adminModel.foto != null) {
          initLoading();
          log('masuk');
          log(' image : ${dataImage.imageFileList.length}');
          if (dataImage.imageFileList.isNotEmpty) {
            final foto = await methodApp.uploadWithImage(
              File(dataImage.imageFileList.first.path),
              "${ConstansApp.idLogin}_${DateTime.now().toIso8601String()}",
              pemasukan: false,
            );
            log('masuk 1 ${dataImage.imageFileList.length}');
            ConstansApp.firebaseFirestore
                .collection(ConstansApp.adminCollection)
                .doc(ConstansApp.idLogin)
                .update(
                  AdminModel(
                    foto: foto,
                    nama: namaC.text,
                    noHp: noHpC.text,
                    jk: jkC.text,
                    status: statusC.text,
                  ).toMap(),
                );
            Get.offAllNamed(Routes.PROFIL);
          } else {
            log('masuk 2');
            ConstansApp.firebaseFirestore
                .collection(ConstansApp.adminCollection)
                .doc(ConstansApp.idLogin)
                .update(
                  AdminModel(
                    foto: adminModel.foto,
                    nama: namaC.text,
                    noHp: noHpC.text,
                    jk: jkC.text,
                    status: statusC.text,
                  ).toMap(),
                );
            Get.offAllNamed(Routes.PROFIL);
          }
          initLoading();
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

  Future alertJK() async {
    await alertValueProfilUpdate(
      title: "Jenil Kelamin",
      listValue: listJK,
      textC: jkC,
    );
  }

  @override
  void onInit() {
    adminModel = Get.arguments;
    initForm(
      nama: adminModel.nama,
      noHp: adminModel.noHp,
      jk: adminModel.jk,
      status: adminModel.status,
    );
    log(Get.arguments.toString());
    super.onInit();
  }

  void initForm({
    final String? nama,
    final String? noHp,
    final String? jk,
    final String? status,
  }) {
    nama == null ? "" : namaC.text = nama;
    noHp == null ? "" : noHpC.text = noHp;
    jk == null ? "" : jkC.text = jk;
    status == null ? "" : statusC.text = status;
  }
}
