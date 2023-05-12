import 'dart:developer';

import '/domain/core/core.dart';

class FormPemasukanController extends GetxController
    with StateMixin<List<KamarModel>> {
  final jenisC = TextEditingController();
  final kamarC = TextEditingController();
  final idrC = TextEditingController();
  final waktuC = TextEditingController();
  List<KamarModel> listKamarTerisi = [];

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

  Future alartKamar(List<KamarModel> listKamar) async {
    await alertFormKamar(
      title: "Kamar",
      listValue: listKamar,
      textC: kamarC,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getListKamar =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.kamarCollection)
          .where('penghuni', isNotEqualTo: []).snapshots();

  @override
  void onInit() {
    getListKamar.listen((event) {
      if (event.size != 0) {
        listKamarTerisi = List.generate(
          event.docs.length,
          (index) => KamarModel.fromDocumentSnapshot(event.docs[index]),
        ).toList();
        log('${listKamarTerisi.length}', name: 'kamar');
        change(listKamarTerisi, status: RxStatus.success());
      } else {
        log('Kosong', name: 'kamar');
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
