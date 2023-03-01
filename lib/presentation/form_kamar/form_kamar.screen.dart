import '../../domain/core/core.dart';

class FormKamarScreen extends GetView<FormKamarController> {
  const FormKamarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormKamarScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormKamarScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
