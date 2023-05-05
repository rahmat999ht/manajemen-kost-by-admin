import 'dart:developer';

import '../../../domain/core/core.dart';

class DetailKamar extends StatelessWidget {
  const DetailKamar({
    super.key,
    required this.kamarModel,
    required this.naiveBayesModel,
  });

  final KamarModel kamarModel;
  final NaiveBayesModel naiveBayesModel;

  @override
  Widget build(BuildContext context) {
    log(kamarModel.fasilitas.toString());
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('No. ${kamarModel.id}'),
      body: Column(
        children: [
          _penghuni(),
          _fasilitas(
            title: 'Fasilitas',
          ),
          _deskripsi(
            title: 'Deskripsi',
            deskripsi: '',
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ButtonPrymary(
          text: 'Status Kamar',
          onPressed: () async {
            await statusKamar(
              context,
              naiveBayesModel,
            );
          },
        ),
      ),
    );
  }

  Widget _penghuni() {
    final methodApp = MethodApp();
    return Column(
      children: [
        ...kamarModel.penghuni!.mapIndexed(
          (i, e) => StreamBuilder<DocumentSnapshot<PenghuniModel>>(
            stream: methodApp.penghuni(kamarModel.penghuni![i].id).snapshots(),
            builder: (ctx, s) {
              if (s.hasData) {
                final penghuniModel = s.data!.data()!;
                return ListTile(
                  leading: AvatarWidget(
                    height: 43,
                    width: 43,
                    heightPlus: 0,
                    imageHash: penghuniModel.image,
                  ),
                  title: Text(
                    penghuniModel.nama,
                  ),
                  subtitle: Text(
                    penghuniModel.peran!,
                  ),
                  trailing: GestureDetector(
                    onTap: () async {
                      await callBy(
                        ctx,
                        penghuniModel.noHp,
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Icon(
                            Icons.phone,
                            color: ColorApp.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Text(
                'Proses ...',
                style: TextStyle(
                  color: ColorApp.blackText,
                  fontSize: 14,
                  height: 1.5,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _fasilitas({
    final String? title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(
              color: ColorApp.blackText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(0),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: kamarModel.fasilitas!.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 185,
              childAspectRatio: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              final data = kamarModel.fasilitas![index];
              return Row(
                children: [
                  SizeApp.w10,
                  const Icon(
                    Icons.album,
                    size: 10,
                  ),
                  SizeApp.w10,
                  Text(
                    data,
                    style: const TextStyle(
                      color: ColorApp.blackText,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _deskripsi({
    final String? title,
    final String? deskripsi,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: Get.width),
          Text(
            title!,
            style: const TextStyle(
              color: ColorApp.blackText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            deskripsi!,
            style: const TextStyle(
              color: ColorApp.blackText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
