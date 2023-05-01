import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class HomeController extends GetxController
    with StateMixin<List<NaiveBayesModel?>> {
  final mhetodApp = MhetodApp();

  List<NaiveBayesModel?> listNaiveBayes = [];
  List<NaiveBayesModel?> listWhere = [];

  List<KamarModel> listKamarKosong =
      Get.find<KamarController>().listKamarKosong;

  final cSearch = TextEditingController();
  final isSearch = false.obs;

  void onChange(String value) {
    value.isEmpty ? isSearch.value = false : isSearch.value = true;

    change(
      value.isEmpty
          ? listWhere
          : listWhere
              .where((element) => element!.idKamar!.id.toLowerCase().contains(
                    value.toLowerCase(),
                  ))
              .toList(),
      status: RxStatus.success(),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get penghuniStream =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.naiveBayesCollection)
          .snapshots();

  @override
  void onInit() {
    log("kamar kosong ${listKamarKosong.length}");
    penghuniStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        listNaiveBayes = List.generate(event.docs.length, (index) {
          final data = event.docs[index];
          // final tgl = data.data()['tglJatuhTempo'] as DateTime;
          // final tglSkrg = Timestamp.now() as DateTime;
          // if (tgl == tglSkrg) {
          //   return NaiveBayesModel.fromDocumentSnapshot(data);
          // }
          return NaiveBayesModel.fromDocumentSnapshot(data);
        });
        log("naive bayes ${listNaiveBayes.length}");
        listWhere =
            listNaiveBayes.where((e) => e?.statusKamar == true).toList();
        change(listWhere, status: RxStatus.success());
      }
    });
    listNaiveBayes
        .sort((a, b) => a!.tglJatuhTempo!.compareTo(b!.tglJatuhTempo!));
    super.onInit();
  }
}
