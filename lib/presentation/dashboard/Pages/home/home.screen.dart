import '../../../../domain/core/core.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        titleSpacing: 20,
        title: const HeaderHome(),
        backgroundColor: ColorApp.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: FormSearchHome(),
        ),
        toolbarHeight: 140,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizeApp.h10,
            // if (state is List<JatuhTempoModel>)
            ValueJatuhTempo(
              title: "Jatuh Tempo",
            ),
            // if (state is List<TerdekatModel>)
            ValueTerdekat(
              title: "Terdekat",
            ),
            ValueKamarKosong(
              title: "Kamar Kosong",
            ),
          ],
        ),
      ),

      //  controller.obx(
      //   (state) {
      //     return
      //   },
      //   onEmpty: const Center(child: Text("Masih Kosong")),
      //   onLoading: const LoadingState(),
      //   onError: (e) {
      //     return Center(child: Text("pesan error : $e"));
      //   },
      // ),
    );
  }
}
