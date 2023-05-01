import '../../../../domain/core/core.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) {
          return Column(
            children: [
              ContentHome(
                title: "Jatuh Tempo",
                state: state,
              ),
              ContentHome(
                title: "Terdekat",
                state: state,
              ),
            ],
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

class ContentHome extends StatelessWidget {
  const ContentHome({
    super.key,
    required this.title,
    required this.state,
  });

  final String title;
  final List<NaiveBayesModel?>? state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeApp.h20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorApp.black,
                  fontSize: 18,
                ),
              ),
              const Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorApp.orange,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 230.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state?.length,
            itemBuilder: (context, index) {
              return CardNaiveBayes(
                naiveBayesModel: state![index],
              );
            },
          ),
        ),
      ],
    );
  }
}
