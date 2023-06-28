import 'dart:developer';

import '../../../../../../domain/core/core.dart';

class ListPemasukanScreen extends GetView<ListPemasukanController> {
  const ListPemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('Pemasukan'),
      body: controller.obx(
        (state) => GroupedListView<PemasukanModel, String>(
          elements: state!,
          groupBy: (e) => controller.groupBy(e),
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) => item1.idr.compareTo(item2.idr),
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => GroupSeparator(
            value,
            onTap: () {
              Get.to(RekapanBulanan(
                title: value,
              ));
              log(value);
            },
          ),
          itemBuilder: (c, e) => ValueGrubPemasukan(
            e,
            onTap: () {
              Get.to(DetailPemasukan(e: e));
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

class RekapanBulanan extends GetView<ListPemasukanController> {
  const RekapanBulanan({super.key, required this.title});

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
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final value = data[index];
              final idr = controller.formatRupiah("${value.idr}");
              return ListTile(
                title: Text(value.jenis),
                subtitle: Text(value.dateUpload.toDate().day.toString()),
                trailing: Text(
                  idr,
                  style: const TextStyle(
                    color: ColorApp.green,
                  ),
                ),
              );
            },
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
