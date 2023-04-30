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
              SizedBox(
                height: 220.0,
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
              )
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
