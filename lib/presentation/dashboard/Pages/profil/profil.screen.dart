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
            return StreamProfile(admin: data);
          }
          return const StreamProfile.nullValue();
        },
      ),
    );
  }
}

class StreamProfile extends StatelessWidget {
  const StreamProfile({
    super.key,
    required this.admin,
  }) : isStream = true;

  const StreamProfile.nullValue({
    super.key,
  })  : isStream = false,
        admin = null;

  final AdminModel? admin;
  final bool isStream;

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
                      child: LaodingState(),
                    ),
              SizeApp.h30,
              const Divider(
                height: 10,
                thickness: 1.5,
              ),
              SizeApp.h30,
              CardProfile(
                onTap: () {},
                title: 'Personal details',
                icon: Assets.person,
              ),
              SizeApp.h20,
              CardProfile(
                onTap: () {},
                title: 'Pemasukan',
                icon: Assets.pemasukan2,
              ),
              SizeApp.h20,
              CardProfile(
                onTap: () {},
                title: 'Pengeluaran',
                icon: Assets.pengeluaran2,
              ),
              SizeApp.h30,
              const Divider(
                height: 10,
                thickness: 1.5,
              ),
            ],
          ),
          Column(
            children: [
              CardProfile(
                onTap: () {},
                title: 'Tentang',
                icon: Assets.tentang,
              ),
              SizeApp.h20,
              ButtonPrymary(
                onPressed: () {},
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
