import 'dart:developer';

import '../../../domain/core/core.dart';

class VerifikasiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final String valueSubTitle =
      'Kami telah mengirim kode verifikasi \nke nomor ponsel kamu';

  final listOtp = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void tapVerifikasi() {
    log("tapVerifikasi");
  }
}
