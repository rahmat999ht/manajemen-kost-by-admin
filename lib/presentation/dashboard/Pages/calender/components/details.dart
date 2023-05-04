import 'dart:developer';

import 'package:manajemen_kost_by_admin/domain/core/core.dart';

import '../../../../../domain/interfaces/app_bar/app_bar_back.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.kamarModel,
  });

  final KamarModel kamarModel;

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
                    onTap: () {},
                    child: Card(
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
