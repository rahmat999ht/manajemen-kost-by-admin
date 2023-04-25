import '../../../../../../domain/core/core.dart';

class TentangAppScreen extends GetView<TentangAppController> {
  const TentangAppScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TentangAppScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
