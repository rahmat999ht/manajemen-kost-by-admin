import '../../../../../../../domain/core/core.dart';

class ValueGrubPemasukan extends GetView<ListPemasukanController> {
  const ValueGrubPemasukan(
    this.e, {
    super.key,
    required this.onTap,
  });

  final PemasukanModel e;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final c = controller;
    final nameMonth = c.listNameMonth[c.month(e) - 1];
    final idr = c.formatRupiah("${e.idr}");
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: e.jenis == 'Air'
            ? const CircleAvatar(
                backgroundColor: ColorApp.blue,
                child: Icon(
                  Icons.water_drop,
                  color: ColorApp.white,
                ),
              )
            : const CircleAvatar(
                backgroundColor: ColorApp.orange,
                child: Icon(
                  Icons.electric_bolt_sharp,
                  color: ColorApp.white,
                ),
              ),
        title: Text(e.jenis),
        subtitle: Text(
            '${c.day(e)} $nameMonth ${c.year(e)}, ${c.hour(e)}:${c.minute(e)}'),
        trailing: Text(
          idr,
          style: const TextStyle(
            color: ColorApp.green,
          ),
        ),
      ),
    );
  }
}
