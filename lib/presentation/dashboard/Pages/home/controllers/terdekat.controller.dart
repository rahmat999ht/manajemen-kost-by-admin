import 'dart:developer';

import '../../../../../domain/core/core.dart';

class TerdekatController extends GetxController
    with StateMixin<List<TerdekatModel>> {
  final tglSkrg = Timestamp.now().toDate();

  List<TerdekatModel> listTerdekat = [];
  List<TerdekatModel>? listWhere = [];

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
        listTerdekat = List.generate(event.docs.length, (index) {
          final data = event.docs[index];
          log("data kurang dari 3 hari ${data.data()}");
          return TerdekatModel.fromDocumentSnapshot(data);
        });
        log("naive bayes ${listTerdekat.length}");
        listWhere = listTerdekat
            .where(
              (e) =>
                  e.statusKamar == true &&
                  tglSkrg.difference(e.tglJatuhTempo!.toDate()).inDays >= -3,
            )
            .toList();
        log("listWhere ${listWhere!.length}");
        change(listWhere, status: RxStatus.success());
      }
    });
    listTerdekat.sort((a, b) => a.tglJatuhTempo!.compareTo(b.tglJatuhTempo!));
    super.onInit();
  }
}
