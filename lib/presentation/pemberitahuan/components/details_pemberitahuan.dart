import '../../../domain/core/core.dart';

class DetailPemberitahuan extends StatelessWidget {
  const DetailPemberitahuan({
    super.key,
    required this.pemberitahuanModel,
  });

  final PemberitahuanModel pemberitahuanModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('No. ${pemberitahuanModel.idKamar!.id}'),
      body: _dataKamar(),
    );
  }

  Widget _dataKamar() {
    final methodApp = MethodApp();
    return StreamBuilder<DocumentSnapshot<KamarModel>>(
      stream: methodApp.kamar(pemberitahuanModel.idKamar!.id).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.data()!;
          return Column(
            children: [
              ...data.penghuni!.mapIndexed(
                (i, e) => StreamBuilder<DocumentSnapshot<PenghuniModel>>(
                  stream: methodApp.penghuni(data.penghuni![i].id).snapshots(),
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
                    } else {
                      return const Text(
                        'Proses ...',
                        style: TextStyle(
                          color: ColorApp.blackText,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      );
                    }
                  },
                ),
              ),
              _fasilitas(
                title: 'Fasilitas',
                kamarModel: data,
              ),
              // _deskripsi(
              //   title: 'Deskripsi',
              //   deskripsi: '',
              // )
            ],
          );
        } else {
          return const Text(
            'Proses ...',
            style: TextStyle(
              color: ColorApp.blackText,
              fontSize: 14,
              height: 1.5,
            ),
          );
        }
      },
    );
  }

  Widget _fasilitas({
    final String? title,
    final KamarModel? kamarModel,
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
            itemCount: kamarModel!.fasilitas!.length,
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
    // final KamarModel? kamarModel,
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
