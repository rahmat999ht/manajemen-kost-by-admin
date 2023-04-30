import '../../../../../domain/core/core.dart';

class CardNaiveBayes extends GetView<HomeController> {
  const CardNaiveBayes({
    super.key,
    required this.naiveBayesModel,
  });

  final NaiveBayesModel? naiveBayesModel;

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
              offset: const Offset(10.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: StreamBuilder(
          stream: controller.mhetodApp
              .kamar(
                naiveBayesModel!.idKamar!.id,
              )
              .snapshots(),
          builder: (ctx, s) {
            if (s.hasData) {
              final data = s.data!.data()!;
              final filterData = data.penghuni!.isNotEmpty;
              return filterData
                  ? StreamBuilder(
                      stream: controller.mhetodApp
                          .penghuni(
                            data.penghuni!.first.id,
                          )
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final dataPenghuni = snapshot.data!.data()!;
                          return Row(
                            children: [
                              AvatarWidget(
                                imageHash: dataPenghuni.image,
                                width: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data.id!,
                                  ),
                                  Text(
                                    dataPenghuni.nama,
                                  ),
                                  Text(
                                    '${data.gedung}',
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return const AvatarWidget(imageHash: null);
                      },
                    )
                  : const Icon(
                      Icons.person,
                      size: 80,
                      color: ColorApp.orange,
                    );
            }
            return const Center(
              child: Text("Masih Kosong"),
            );
          },
        ),
      ),
    );
  }
}
