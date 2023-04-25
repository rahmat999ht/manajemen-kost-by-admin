import '../../../../../../domain/core/core.dart';

class ListPengeluaranScreen extends GetView<ListPengeluaranController> {
  const ListPengeluaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Pemasukan',
        () {
          Get.offAllNamed(Routes.DASHBOARD);
        },
      ),
      body: const Center(
        child: Text(
          'ListPengeluaranScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
