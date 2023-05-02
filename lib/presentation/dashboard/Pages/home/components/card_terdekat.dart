import '../../../../../domain/core/core.dart';

class CardTerdekat extends GetView<HomeController> {
  const CardTerdekat({
    super.key,
    required this.listTerdekat,
    required this.index,
  });

  final List<TerdekatModel?> listTerdekat;
  final int index;

  @override
  Widget build(BuildContext context) {
    final terdekatModel = listTerdekat[index];
    final day = terdekatModel!.tglJatuhTempo?.toDate().day;
    final month = terdekatModel.tglJatuhTempo?.toDate().month;
    return Container(
      margin: EdgeInsets.only(
        left: 12,
        bottom: 20,
        top: 12,
        right: listTerdekat.length == index + 1 ? 30 : 0,
      ),
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
              terdekatModel.idKamar!.id,
            )
            .snapshots(),
        builder: (ctx, s) {
          if (s.hasData) {
            final data = s.data!.data()!;
            return StreamBuilder(
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
                      Container(
                        margin: const EdgeInsets.all(0),
                        height: Get.height,
                        decoration: const BoxDecoration(
                          color: ColorApp.grayForm,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: AvatarWidget(
                          imageHash: dataPenghuni.image,
                          width: 107,
                          height: dataPenghuni.image != null ? 189 : 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.kamar,
                                ),
                                SizeApp.w8,
                                Text(
                                  'No. ${data.id!}',
                                  style: const TextStyle(
                                    color: ColorApp.blackNavi,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizeApp.h10,
                            Text(
                              dataPenghuni.nama,
                              style: const TextStyle(
                                color: ColorApp.blackText,
                                fontSize: 16,
                              ),
                            ),
                            SizeApp.h20,
                            Text(
                              dataPenghuni.status,
                              style: const TextStyle(
                                color: ColorApp.gray,
                              ),
                            ),
                            SizeApp.h12,
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.lantai,
                                ),
                                SizeApp.w8,
                                Text(
                                  data.lantai!,
                                  style: const TextStyle(
                                    color: ColorApp.gray,
                                  ),
                                ),
                                SizeApp.w20,
                                SvgPicture.asset(
                                  Assets.gedung,
                                ),
                                SizeApp.w8,
                                Text(
                                  data.gedung!,
                                  style: const TextStyle(
                                    color: ColorApp.gray,
                                  ),
                                ),
                              ],
                            ),
                            SizeApp.h18,
                            RichText(
                              text: TextSpan(
                                text: '$day ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.blackText,
                                  fontSize: 20,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: controller.months[month! - 1],
                                    style: const TextStyle(
                                      color: ColorApp.gray,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: Text("Proses ..."),
                );
              },
            );
          }
          return const Center(
            child: Text("Masih Kosong"),
          );
        },
      ),
    );
  }
}
