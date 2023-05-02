import '../../../../../domain/core/core.dart';

class CardCalender extends GetView<CalenderController> {
  final void Function()? onTap;
  final NaiveBayesModel? data;
  const CardCalender({
    Key? key,
    required this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sisa3Hari =
        controller.tglSkrg.difference(data!.tglJatuhTempo!.toDate()).inDays ==
            -3;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: sisa3Hari
                ? [
                    Colors.yellow.shade600,
                    Colors.yellow.shade800,
                    Colors.yellow.shade900,
                    // const Color(0xffff1744),
                  ]
                : [
                    Colors.red.shade300,
                    Colors.red.shade500,
                    Colors.red.shade800,
                    // const Color(0xffff1744),
                  ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: Text(
                  sisa3Hari ? '3 hari ke depan' : 'Hari ini',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              SizeApp.h6,
              Row(
                children: [
                  StreamBuilder<DocumentSnapshot<KamarModel>>(
                    stream: controller.methodApp
                        .kamar(data!.idKamar!.id)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final kamarModel = snapshot.data!.data()!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sisa3Hari
                                ? Text(
                                    'Kamar dengan No. ${kamarModel.id} ${kamarModel.lantai} ${kamarModel.gedung} dalam \n3 hari ke depan akan jatuh tempo ',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  )
                                : Text(
                                    'Kamar dengan No. ${kamarModel.id} ${kamarModel.lantai} ${kamarModel.gedung} telah \nmelewati tanggal pembayaran',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                            SizeApp.h12,
                            StreamBuilder<DocumentSnapshot<PenghuniModel>>(
                              stream: controller.methodApp
                                  .penghuni(kamarModel.penghuni!.first.id)
                                  .snapshots(),
                              builder: (ctx, s) {
                                if (s.hasData) {
                                  final penghuniModel = s.data!.data()!;
                                  return Text(
                                    '${penghuniModel.nama} - ${penghuniModel.peran}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  );
                                }
                                return const Text(
                                  'Proses ...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      }
                      return const Text(
                        ' - ',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
