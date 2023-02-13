import '../../../../domain/core/core.dart';

class CalenderScreen extends GetView<CalenderController> {
  const CalenderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalenderScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CalenderScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
