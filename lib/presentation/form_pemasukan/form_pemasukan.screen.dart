import '../../domain/core/core.dart';

class FormPemasukanScreen extends GetView<FormPemasukanController> {
  const FormPemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPemasukanScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormPemasukanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
