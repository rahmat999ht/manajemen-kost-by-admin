import 'dart:developer';

import '../../../../../../../domain/core/core.dart';

class ProfileUpdateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController namaC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController jkC = TextEditingController();
  TextEditingController statusC = TextEditingController();

  final listJK = <String>[
    'Laki-laki',
    'Perempuan',
  ];

  late final AdminModel adminModel;
  final isLoading = false.obs;

  void updateProfil() {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.adminCollection)
        .doc(ConstansApp.idLogin)
        .update(
          AdminModel(
            nama: namaC.text,
            noHp: noHpC.text,
            jk: jkC.text,
            status: statusC.text,
          ).toMap(),
        );

    Get.offAllNamed(Routes.PROFIL);
  }

  Future alertJK() async {
    await alertValueProfil(
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
