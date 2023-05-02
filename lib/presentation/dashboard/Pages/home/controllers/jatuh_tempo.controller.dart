import 'dart:developer';

import '../../../../../domain/core/core.dart';

class JatuhTempoController extends GetxController
    with StateMixin<List<JatuhTempoModel>> {
  final tglSkrg = Timestamp.now().toDate();

  List<JatuhTempoModel> listJatuhTempo = [];
  List<JatuhTempoModel>? listWhere = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> get penghuniStream =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.naiveBayesCollection)
          .snapshots();

  @override
  void onInit() {
    penghuniStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        listJatuhTempo = List.generate(event.docs.length, (index) {
          final data = event.docs[index];
          log("data kurang dari 3 hari ${data.data()}");
          return JatuhTempoModel.fromDocumentSnapshot(data);
        });
        log("naive bayes ${listJatuhTempo.length}");
        listWhere = listJatuhTempo
            .where(
              (e) =>
                  e.statusKamar == true &&
                  tglSkrg.difference(e.tglJatuhTempo!.toDate()).inDays >= 0,
            )
            .toList();
        log("listWhere ${listWhere!.length}");
        change(listWhere, status: RxStatus.success());
      }
    });
    listJatuhTempo.sort((a, b) => a.tglJatuhTempo!.compareTo(b.tglJatuhTempo!));
    super.onInit();
  }
}
