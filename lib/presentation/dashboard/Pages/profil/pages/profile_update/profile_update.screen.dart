import 'package:manajemen_kost_by_admin/domain/interfaces/state/image.dart';

import '../../../../../../domain/core/core.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBar(
        'Edit profil',
        () {
          Get.offAllNamed(Routes.DASHBOARD);
        },
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const WrapperImageUpdateProfil(),
                      SizeApp.h36,
                      TextForm.border(
                        controller: controller.namaC,
                        titel: 'Nama lengkap',
                        color: ColorApp.gray,
                        isCheck: true,
                      ),
                      SizeApp.h12,
                      TextForm.border(
                        controller: controller.noHpC,
                        titel: 'No. HP',
                        color: ColorApp.gray,
                        isCheck: true,
                        isPhone: true,
                      ),
                      SizeApp.h12,
                      TextForm.border(
                        controller: controller.jkC,
                        titel: 'Jenis kelamin',
                        color: ColorApp.gray,
                        isCheck: true,
                      ),
                      SizeApp.h12,
                      TextForm.border(
                        controller: controller.statusC,
                        titel: 'Status',
                        color: ColorApp.gray,
                        isCheck: true,
                      ),
                    ],
                  ),
                  SizeApp.h100,
                  SizeApp.h30,
                  ButtonPrymary.isBlack(
                    onPressed: () {},
                    text: 'Simpan',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WrapperImageUpdateProfil extends GetView<ProfileUpdateController>
    with ImageState {
  const WrapperImageUpdateProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => imageUpdateProfilSucces(
        state!,
        controller.getImage,
      ),
      onEmpty: imageUpdateProfilEmpty(
        controller.avatar,
        controller.getImage,
      ),
    );
  }
}
