import '../../../../domain/core/core.dart';

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
