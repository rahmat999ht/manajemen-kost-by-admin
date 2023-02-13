import '../../../../domain/core/core.dart';

class ListPenghuniScreen extends GetView<ListPenghuniController> {
  const ListPenghuniScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPenghuniScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListPenghuniScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
