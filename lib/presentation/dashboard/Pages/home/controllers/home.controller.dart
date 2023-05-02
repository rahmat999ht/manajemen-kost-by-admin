import '../../../../../domain/core/core.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  final methodApp = MethodApp();
  final tglSkrg = Timestamp.now().toDate();
  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Nov',
    'Des',
  ];

  final cSearch = TextEditingController();
  final isSearch = false.obs;

  final cTerdekat = Get.find<TerdekatController>();
  final cJatuhTempo = Get.find<JatuhTempoController>();
  final cKamarKosong = Get.find<KamarController>();
}
