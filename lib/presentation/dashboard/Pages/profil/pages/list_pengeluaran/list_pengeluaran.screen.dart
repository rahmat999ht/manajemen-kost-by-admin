import 'dart:developer';

import 'package:grouped_list/grouped_list.dart';

import '../../../../../../domain/core/core.dart';

class ListPengeluaranScreen extends GetView<ListPengeluaranController> {
  const ListPengeluaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('Pengeluaran'),
      body: controller.obx(
        (state) => GroupedListView<PengeluaranModel, String>(
          elements: state!,
          groupBy: (e) => controller.groupBy(e),
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) => item1.idr.compareTo(item2.idr),
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => GroupSeparator(
            value,
            onTap: () {
              Get.to(RekapanPengeluaranBulanan(
                title: value,
              ));
              log(value);
            },
          ),
          itemBuilder: (c, e) => ValueGrub(
            e,
            onTap: () {
              Get.to(DetailPengeluaran(e: e));
            },
          ),
        ),
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const LoadingState(),
        onError: (e) {
          return Center(child: Text("error : $e"));
        },
      ),
    );
  }
}

class RekapanPengeluaranBulanan extends GetView<ListPengeluaranController> {
  const RekapanPengeluaranBulanan({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('Rekapan $title'),
      body: controller.obx(
        (state) {
          final threeDigits = controller.threeDigits(title);
          int monthNumber = -1;
          for (int i = 0; i < controller.listNameMonth.length; i++) {
            if (controller.listNameMonth[i].startsWith(threeDigits)) {
              monthNumber = i + 1; // Menggunakan indeks + 1 sebagai nilai bulan
              break;
            }
          }
          final data = state!.where((e) {
            return e.dateUpload.toDate().month == monthNumber;
          }).toList();
          int valueTotalBulanan = 0;
          // for (int i = 0; i < data.length; i++) {
          for (var e in data) {
            final bulanan = e.idr;
            valueTotalBulanan = valueTotalBulanan + bulanan;
          }
          final totalBulanan = controller.formatRupiah("$valueTotalBulanan");
          // }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final value = data[index];
                    final idr = controller.formatRupiah("${value.idr}");
                    return ListTile(
                      title: Text(value.jenis),
                      subtitle: Text("tgl ${value.dateUpload.toDate().day}"),
                      trailing: Text(
                        idr,
                        style: const TextStyle(
                          color: ColorApp.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Card(
                elevation: 10,
                color: ColorApp.orange,
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text('Total Pengeluaran'),
                      const Spacer(),
                      Text(
                        ':   ${totalBulanan.replaceAll('-', '')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const LoadingState(),
        onError: (e) {
          return Center(child: Text("error : $e"));
        },
      ),
    );
  }
}
