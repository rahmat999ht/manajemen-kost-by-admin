import '../../../../domain/core/core.dart';

class ProfilScreen extends GetView<ProfilController> {
  const ProfilScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
