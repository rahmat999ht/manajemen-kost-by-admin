import '../../../../../../domain/core/core.dart';

class TentangAppScreen extends GetView<TentangAppController> {
  const TentangAppScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        title: const Text('Tentang App'),
        centerTitle: true,
        elevation: 0,
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
