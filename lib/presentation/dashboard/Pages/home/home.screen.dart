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
            ValueJatuhTempo(
              title: "Jatuh Tempo",
            ),
            ValueTerdekat(
              title: "Terdekat",
            ),
            ValueKamarKosong(
              title: "Kamar Kosong",
            ),
          ],
        ),
      ),
    );
  }
}
