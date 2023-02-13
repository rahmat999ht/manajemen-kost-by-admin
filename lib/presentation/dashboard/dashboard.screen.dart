import 'package:manajemen_kost_by_admin/domain/core/core.dart';

import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        title: const Text('DashboardScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DashboardScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
