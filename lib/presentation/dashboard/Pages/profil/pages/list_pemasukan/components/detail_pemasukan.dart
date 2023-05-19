import '../../../../../../../domain/core/core.dart';

class DetailPemasukan extends GetView<ListPemasukanController> {
  const DetailPemasukan({super.key, required this.e});

  final PemasukanModel e;

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final nameMonth = c.listNameMonth[c.month(e) - 1];
    final idr = c.formatRupiah("${e.idr}");
    return Scaffold(
      appBar: appBarBack('Detail'),
      body: Column(
        children: [
          SizeApp.h40,
          AvatarWidget(
            imageHash: e.foto,
            radius: 12,
            height: 200,
            width: 200,
          ),
          Card(
            elevation: 8,
            margin: const EdgeInsets.all(16),
            color: ColorApp.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  content(
                    'Jenis pembayaran',
                    e.jenis,
                  ),
                  const Divider(),
                  content(
                    'IDR',
                    idr,
                    colorValue: ColorApp.green,
                  ),
                  const Divider(),
                  content(
                    'Tanggal',
                    '${c.day(e)} $nameMonth ${c.year(e)}, ${c.hour(e)}:${c.minute(e)}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding content(
    String title,
    String value, {
    Color? colorValue,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: ColorApp.blackText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colorValue ?? ColorApp.blackNavi,
            ),
          ),
        ],
      ),
    );
  }
}
