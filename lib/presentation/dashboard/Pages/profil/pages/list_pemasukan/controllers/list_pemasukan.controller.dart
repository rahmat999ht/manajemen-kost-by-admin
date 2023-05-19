import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class ListPemasukanController extends GetxController
    with StateMixin<List<PemasukanModel>> {
  var items = <PemasukanModel>[];

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

  int minute(PemasukanModel e) {
    final value = e.dateUpload.toDate().minute;
    return value;
  }

  int hour(PemasukanModel e) {
    String value = '';
    if (e.dateUpload.toDate().hour.bitLength == 1) {
      value = '0${e.dateUpload.toDate().hour}';
    } else {
      value = '${e.dateUpload.toDate().hour}';
    }
    return int.parse(value);
  }

  int day(PemasukanModel e) {
    final value = e.dateUpload.toDate().day;
    return value;
  }

  int month(PemasukanModel e) {
    final value = e.dateUpload.toDate().month;
    return value;
  }

  int year(PemasukanModel e) {
    final value = e.dateUpload.toDate().year;
    return value;
  }

  String groupBy(PemasukanModel element) {
    final month = element.dateUpload.toDate().month;
    final nameMonth = listNameMonth[month - 1];
    final year = element.dateUpload.toDate().year;
    return 'Bulan $nameMonth - $year';
  }

  String formatRupiah(String amount) {
    final formattedAmount = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match.group(1)}.');
    return '+Rp $formattedAmount';
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get pemasukanStream =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.pemasukanCollection)
          .snapshots();

  @override
  void onInit() {
    pemasukanStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        items = List.generate(event.docs.length, (index) {
          final snapshot = event.docs[index];
          return PemasukanModel.fromDocumentSnapshot(snapshot);
        });
        log("${items.length}");
        change(items, status: RxStatus.success());
      }
    });
    items.sort((a, b) => b.dateUpload.compareTo(a.dateUpload));
    super.onInit();
  }
}
