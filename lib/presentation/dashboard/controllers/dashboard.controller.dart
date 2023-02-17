import 'dart:developer';

import '../../../domain/core/core.dart';

class DashboardController extends GetxController with StateMixin<AdminModel> {
  final RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions = <Widget>[];
  bool toogle = true;
  final isLoading = true.obs;
  AdminModel? adminModel;
  late final List<AdminModel> dataAdmin;

  void toPenghuni() {
    Get.toNamed(Routes.PENGHUNI);
  }

  void toPemasukan() {
    Get.toNamed(Routes.PEMASUKAN);
  }

  void toPengeluaran() {
    Get.toNamed(Routes.PENGELUARAN);
  }

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    String? isId = prefs.getString("user_id") ?? '';
    log(isId);
    final dataAllUser = await UtilsApp.firebaseFirestore
        .collection(UtilsApp.adminCollection)
        .get();
    dataAdmin = dataAllUser.docs
        .map((e) => AdminModel.fromDocumentSnapshot(e))
        .toList();

    var dataUserModel = dataAllUser.docs.firstWhere((e) => e.id == isId);
    adminModel = AdminModel.fromDocumentSnapshot(dataUserModel);
    successState(adminModel!);
    if (Get.arguments != null) {
      selectedIndex.value = Get.arguments["selectedIndex"] ?? 0;
    }
    widgetOptions = [
      const HomeScreen(),
      const CalenderScreen(),
      const ListPenghuniScreen(),
      const ProfilScreen(),
    ];
    super.onInit();
  }

  void loadingState() {
    change(
      null,
      status: RxStatus.loading(),
    );
  }

  void successState(AdminModel adminModel) {
    change(
      adminModel,
      status: RxStatus.success(),
    );
  }
}
