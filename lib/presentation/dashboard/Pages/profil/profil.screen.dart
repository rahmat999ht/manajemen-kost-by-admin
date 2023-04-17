import 'package:manajemen_kost_by_admin/presentation/dashboard/Pages/profil/items/header.dart';

import '../../../../domain/core/core.dart';

class ProfilScreen extends GetView<ProfilController> {
  const ProfilScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<AdminModel>>(
        stream: UtilsApp.admin(UtilsApp.idLogin).snapshots(),
        builder: (context, s) {
          if (s.hasData) {
            final data = s.data?.data();
            return StreamProfile(
              admin: data,
              c: controller,
            );
          }
          return StreamProfile.nullValue(
            c: controller,
          );
        },
      ),
    );
  }
}

class StreamProfile extends StatelessWidget {
  const StreamProfile({
    super.key,
    required this.admin,
    required this.c,
  }) : isStream = true;

  const StreamProfile.nullValue({
    super.key,
    required this.c,
  })  : isStream = false,
        admin = null;

  final AdminModel? admin;
  final bool isStream;
  final ProfilController c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizeApp.h60,
              isStream
                  ? HeaderProfile(
                      foto: admin?.foto,
                      nama: admin?.nama,
                      status: admin?.status,
                    )
                  : const SizedBox(
                      height: 167,
                      width: 167,
                      child: LoadingState(),
                    ),
              SizeApp.h30,
              const Divider(
                height: 10,
                thickness: 1.5,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: c.listItem.length,
                itemBuilder: (context, index) {
                  var listTapItem = [
                    () {
                      Get.offAllNamed(
                        Routes.PROFILE_UPDATE,
                        arguments: admin,
                      );
                    },
                    // c.tapPersonalDetails,
                    c.tapPemasukan,
                    c.tapPengeluaran,
                  ];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CardProfile(
                        onTap: listTapItem[index],
                        title: c.listItem[index],
                        icon: c.listAssetsItem[index],
                      ),
                      SizeApp.h20,
                    ],
                  );
                },
              ),
              SizeApp.h10,
              const Divider(
                height: 10,
                thickness: 1.5,
              ),
            ],
          ),
          Column(
            children: [
              CardProfile(
                onTap: c.tapTentang,
                title: 'Tentang',
                icon: Assets.tentang,
              ),
              SizeApp.h20,
              ButtonPrymary(
                onPressed: c.tapLogOut,
                text: 'Log-out',
              ),
              SizeApp.h16,
            ],
          ),
        ],
      ),
    );
  }
}
