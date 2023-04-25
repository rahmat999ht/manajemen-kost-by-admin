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
      body: Column(
        children: const [
          SizedBox(
            height: 220.0,
            // child: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   shrinkWrap: true,
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     return const CardPenghuni(
            //       kamarModel: null,
            //     );
            //   },
            // ),
          )
        ],
      ),
    );
  }
}

class CardPenghuni extends StatelessWidget {
  const CardPenghuni({
    super.key,
    required this.kamarModel,
  });

  final KamarModel? kamarModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // right: 12,
        left: 12,
        bottom: 20,
        top: 12,
      ),
      child: Container(
        height: 180.0,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(-10.0, 10.0),
              blurRadius: 20.0,
              spreadRadius: 4.0,
            )
          ],
        ),
        child: Row(
          children: [
            StreamBuilder(
                stream:
                    UtilsApp.penghuni(kamarModel!.penghuni![0].id).snapshots(),
                builder: (ctx, s) {
                  if (s.hasData) {
                    final data = s.data!.data();
                    return AvatarWidget(
                      imageHash: data!.image,
                      height: 180,
                      width: 80,
                      radius: 10,
                    );
                  }
                  return const SizedBox();
                }),
            Column(
              children: [
                Text(
                  'no. ${kamarModel!.noKamar}',
                ),
                Text(
                  'no. ${kamarModel!.noKamar}',
                ),
                Text(
                  'no. ${kamarModel!.noKamar}',
                ),
                Text(
                  'no. ${kamarModel!.noKamar}',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
