import '../../../domain/core/core.dart';

class FormPengeluaranScreen extends GetView<FormPengeluaranController> {
  const FormPengeluaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPengeluaranScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormPengeluaranScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
