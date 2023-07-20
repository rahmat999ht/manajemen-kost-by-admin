import 'package:manajemen_kost_by_admin/presentation/pemberitahuan/controllers/pemberitahuan.controller.dart';

import '../../domain/core/core.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      // permanent: true,
    );
    Get.lazyPut<KamarController>(
      () => KamarController(),
      // permanent: true,
    );
    Get.lazyPut<JatuhTempoController>(
      () => JatuhTempoController(),
      // permanent: true,
    );
    Get.lazyPut<TerdekatController>(
      () => TerdekatController(),
      // permanent: true,
    );

    final cTerdekat = Get.find<TerdekatController>();
    final cJatuhTempo = Get.find<JatuhTempoController>();
    final cKamarKosong = Get.find<KamarController>();
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        titleSpacing: 20,
        title: const HeaderHome(),
        actions: const [Acions()],
        backgroundColor: ColorApp.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: FormSearchHome(
            cTerdekat: cTerdekat,
            cJatuhTempo: cJatuhTempo,
            cKamarKosong: cKamarKosong,
          ),
        ),
        toolbarHeight: 140,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueJatuhTempo(
              title: "Jatuh Tempo",
              controller: cJatuhTempo,
            ),
            ValueTerdekat(
              title: "Terdekat",
              controller: cTerdekat,
            ),
            ValueKamarKosong(
              title: "Kamar Kosong",
              controller: cKamarKosong,
            ),
          ],
        ),
      ),
    );
  }
}

class Acions extends GetView<PemberitahuanController> {
  const Acions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PemberitahuanController>(
      () => PemberitahuanController(),
      // permanent: true,
    );
    return controller.obx(
      (state) => data(state!),
      onEmpty: const Padding(
        padding: EdgeInsets.only(right: 20, top: 8),
        child: Icon(Icons.notifications_active_outlined),
      ),
      onLoading: const SizedBox(height: 130, child: LoadingState()),
      onError: (e) {
        return Center(child: Text("pesan error : $e"));
      },
    );
  }

  Widget data(List<PemberitahuanModel> data) {
    final dataPemberitahuan = data.where((e) => e.isView == false).toList();
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 32),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.PEMBERITAHUAN);
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            const Icon(
              Icons.notifications_active_outlined,
              // size: 28,
            ),
            dataPemberitahuan.isNotEmpty
                ? const Card(
                    color: ColorApp.red,
                    child: SizedBox(
                      height: 8,
                      width: 8,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
