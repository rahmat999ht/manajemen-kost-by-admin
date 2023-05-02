import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class HomeController extends GetxController
    with StateMixin<List<NaiveBayesModel?>> {
  final mhetodApp = MhetodApp();
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

  List<NaiveBayesModel?> listNaiveBayes = [];
  List<NaiveBayesModel?> listWhere = [];
  List<TerdekatModel> listTerdekat =
      Get.find<TerdekatController>().listTerdekat;
  List<JatuhTempoModel> listJatuhTempo =
      Get.find<JatuhTempoController>().listJatuhTempo;

  final cSearch = TextEditingController();
  final isSearch = false.obs;

  void onChange(String value) {
    value.isEmpty ? isSearch.value = false : isSearch.value = true;

    change(
      value.isEmpty
          ? listWhere
          : listWhere
              .where((element) => element!.idKamar!.id.toLowerCase().contains(
                    value.toLowerCase(),
                  ))
              .toList(),
      status: RxStatus.success(),
    );
  }

  @override
  void onInit() {
    // listWhere = [listTerdekat, listJatuhTempo,];
    super.onInit();
  }
}
