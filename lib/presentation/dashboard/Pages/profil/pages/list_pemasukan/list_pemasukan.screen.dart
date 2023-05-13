import '../../../../../../domain/core/core.dart';
import 'controllers/list_pemasukan.controller.dart';

class ListPemasukanScreen extends GetView<ListPemasukanController> {
  const ListPemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBatal(
        'Pemasukan',
        () {
          Get.offAllNamed(Routes.DASHBOARD);
        },
      ),
      body: const Center(
        child: Text(
          'ListPemasukanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
