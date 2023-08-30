import 'dart:developer';

import '../../../domain/core/core.dart';

class TerdekatController extends GetxController
    with StateMixin<List<TerdekatModel>> {
  final tglSkrg = Timestamp.now().toDate();

  List<TerdekatModel> listTerdekat = [];
  List<TerdekatModel> listWhereAktif = [];
  List<TerdekatModel>? listWhere = [];

  void onChange(String value, RxBool isSearch) {
    value.isEmpty ? isSearch.value = false : isSearch.value = true;

    change(
      value.isEmpty
          ? listWhere
          : listWhere!
              .where((element) => element.idKamar!.id.toLowerCase().contains(
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
        listWhereAktif = listTerdekat.where((e) => e.terisi == true).toList();
        listWhere = listWhereAktif
            .where(
              (e) =>
                  tglSkrg.difference(e.tglJatuhTempo!.toDate()).inDays >= -3 &&
                  tglSkrg.difference(e.tglJatuhTempo!.toDate()).inDays < 0,
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
