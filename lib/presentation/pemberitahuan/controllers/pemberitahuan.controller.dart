import 'dart:developer';

import '../../../domain/core/core.dart';

class PemberitahuanController extends GetxController
    with StateMixin<List<PemberitahuanModel>> {
  List<PemberitahuanModel> listPemberitahuan = [];

  final listMonth = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Seb',
    'Okt',
    'Nov',
    'Des',
  ];

  String getDateTime(Timestamp dateTime) {
    final dateTimeNow = DateTime.now();
    final date = dateTime.toDate();

    if (date.year < dateTimeNow.year) {
      final namaMonth = listMonth[date.month - 1];
      // Aug 2, 2022
      return "$namaMonth ${date.day},${date.year}";
    } else if (date.month < dateTimeNow.month) {
      // 2 months ago
      return "${dateTimeNow.month - date.month} bulan lalu";
    } else if (date.day < dateTimeNow.day) {
      // 2 days ago
      return "${dateTimeNow.day - date.day} hari lalu";
    } else if (date.hour < dateTimeNow.hour) {
      // 2 hours ago
      return "${dateTimeNow.hour - date.hour} jam lalu";
    } else if (date.minute < dateTimeNow.minute) {
      return "${dateTimeNow.minute - date.minute} menit lalu";
    }
    return "Now";
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getListPemberitahuan =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.pemberitahuanCollection)
          .snapshots();

  @override
  void onInit() {
    getListPemberitahuan.listen((event) {
      if (event.size != 0) {
        listPemberitahuan = List.generate(
          event.docs.length,
          (index) => PemberitahuanModel.fromDocumentSnapshot(event.docs[index]),
        ).toList();
        log('${listPemberitahuan.length}', name: 'Pemberitahuan');
        listPemberitahuan.sort(
          (a, b) => b.dateUpload!.compareTo(a.dateUpload!),
        );
        change(listPemberitahuan, status: RxStatus.success());
      } else {
        log('Kosong', name: 'kamar');
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
