import 'dart:developer';

import '/domain/core/core.dart';

class ListPengeluaranController extends GetxController
    with StateMixin<List<PengeluaranModel>> {
  final cSearch = TextEditingController();
  final isSearch = false.obs;
  var items = <PengeluaranModel>[];

  final listNameMonth = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des"
  ];

  int minute(PengeluaranModel e) {
    final value = e.dateUpload.toDate().minute;
    return value;
  }

  int hour(PengeluaranModel e) {
    String value = '';
    if (e.dateUpload.toDate().hour.bitLength == 1) {
      value = '0${e.dateUpload.toDate().hour}';
    } else {
      value = '${e.dateUpload.toDate().hour}';
    }
    return int.parse(value);
  }

  int day(PengeluaranModel e) {
    final value = e.dateUpload.toDate().day;
    return value;
  }

  int month(PengeluaranModel e) {
    final value = e.dateUpload.toDate().month;
    return value;
  }

  int year(PengeluaranModel e) {
    final value = e.dateUpload.toDate().year;
    return value;
  }

  String groupBy(PengeluaranModel element) {
    final month = element.dateUpload.toDate().month;
    final nameMonth = listNameMonth[month - 1];
    final year = element.dateUpload.toDate().year;
    return 'Bulan $nameMonth - $year';
  }

  String formatRupiah(String amount) {
    final formattedAmount = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match.group(1)}.');
    return '-Rp $formattedAmount';
  }

  void onChange(String value) {
    value.isEmpty ? isSearch.value = false : isSearch.value = true;

    change(
      value.isEmpty
          ? items
          : items
              .where((element) => element.jenis.toLowerCase().contains(
                    value.toLowerCase(),
                  ))
              .toList(),
      status: RxStatus.success(),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get pengeluaranStream =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.pengeluaranCollection)
          .snapshots();

  @override
  void onInit() {
    pengeluaranStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        items = List.generate(event.docs.length, (index) {
          final snapshot = event.docs[index];
          return PengeluaranModel.fromDocumentSnapshot(snapshot);
        });
        log("${items.length}");
        change(items, status: RxStatus.success());
      }
    });
    items.sort((a, b) => b.dateUpload.compareTo(a.dateUpload));
    super.onInit();
  }
}
