import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';
import 'package:manajemen_kost_by_admin/domain/models/naive_bayes.dart';

class HomeController extends GetxController
    with StateMixin<List<NaiveBayesModel>> {
  List<NaiveBayesModel> listNaiveBayes = [];

  List<KamarModel> listKamarKosong =
      Get.find<KamarController>().listKamarKosong;

  Stream<QuerySnapshot<Map<String, dynamic>>> get penghuniStream =>
      UtilsApp.firebaseFirestore
          .collection(UtilsApp.naiveBayesCollection)
          .snapshots();

  @override
  void onInit() {
    penghuniStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        listNaiveBayes = List.generate(event.docs.length, (index) {
          final data = event.docs[index];
          if (data.data()['penghuni'] == []) {
            return NaiveBayesModel.fromDocumentSnapshot(data);
          }
          return {} as NaiveBayesModel;
        });
        log("${listNaiveBayes.length}");
        change(listNaiveBayes, status: RxStatus.success());
      }
    });
    listNaiveBayes.sort((a, b) => a.idKamar!.id.compareTo(b.idKamar!.id));
    super.onInit();
  }
}
