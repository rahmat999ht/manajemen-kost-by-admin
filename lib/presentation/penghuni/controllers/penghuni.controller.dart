import 'dart:developer';

import '../../../domain/core/core.dart';

class PenghuniController extends GetxController
    with StateMixin<List<KamarModel>> {
  // final RxString? cGedung = ''.obs;
  List<KamarModel> listKamarModel = [];

  final listGedung = ["Gedung A", "Gedung B"];
  PageController pageController = PageController();
  final selectionTab = 0.obs;
  RxList<bool> isLoadingList = <bool>[].obs;
  // final loading = false.obs;

  void changeSelectionTab(int value) {
    selectionTab.value = value;
    pageController.jumpToPage(value);
  }

  String groupBy(KamarModel element) {
    final lantai = element.lantai!;
    return lantai;
  }

  Future addKamar(
    String noKamar,
    int itemIndex,
    // String gedung,
  ) async {
    isLoadingList[itemIndex] = !isLoadingList[itemIndex];
    // final dataKamar = await ConstansApp.firebaseFirestore
    //     .collection(ConstansApp.kamarCollection)
    //     .doc(noKamar)
    //     .get();
    // if (!dataKamar.exists) {
    //   log("data 0");
    //   ConstansApp.firebaseFirestore
    //       .collection(ConstansApp.kamarCollection)
    //       .doc(noKamar)
    //       .set(
    //         KamarModel.add(
    //           noKamar,
    //           lantai,
    //           gedung,
    //         ).toMap(),
    //       );
    // }
    Future.delayed(const Duration(seconds: 3)).then(
      (_) {
        Get.toNamed(
          Routes.FORM_KAMAR,
          arguments: noKamar,
        );
        isLoadingList[itemIndex] = !isLoadingList[itemIndex];
      },
    );
  }

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
        // listKamarKosong =
        //     listKamarModel.where((e) => e.penghuni!.isEmpty).toList();
        // log('${listKamarKosong.length}', name: 'kamar');
        isLoadingList.value = List.filled(listKamarModel.length, false);
        change(listKamarModel, status: RxStatus.success());
      } else {
        log('Kosong', name: 'kamar');
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
