import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class KamarController extends GetxController with StateMixin<List<KamarModel>> {
  List<KamarModel> listKamarModel = [];
  List<KamarModel> listKamarKosong = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> get getListKamar =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.kamarCollection)
          .snapshots();

  @override
  void onInit() {
    getListKamar.listen((event) {
      if (event.size != 0) {
        listKamarModel = List.generate(
          event.docs.length,
          (index) => KamarModel.fromDocumentSnapshot(event.docs[index]),
        ).toList();
        log('${listKamarModel.length}', name: 'kamar');
        listKamarKosong =
            listKamarModel.where((e) => e.penghuni!.isEmpty).toList();
        log('${listKamarKosong.length}', name: 'kamar');
        change(listKamarKosong, status: RxStatus.success());
      } else {
        log('Kosong', name: 'kamar');
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
