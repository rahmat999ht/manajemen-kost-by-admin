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
      body: controller.obx(
        (state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizeApp.h10,
                ValueJatuhTempo(
                  title: "Jatuh Tempo",
                  value: state,
                ),
                ValueJatuhTempo(
                  title: "Terdekat",
                  value: state,
                ),
                ValueKamarKosong(
                  title: "Kamar Kosong",
                  value: controller.listKamarKosong,
                ),
              ],
            ),
          );
        },
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const LoadingState(),
        onError: (e) {
          return Center(child: Text("pesan error : $e"));
        },
      ),
    );
  }
}
