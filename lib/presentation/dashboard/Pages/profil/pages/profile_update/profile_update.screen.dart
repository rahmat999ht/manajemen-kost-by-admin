import '../../../../../../domain/core/core.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBatal(
        'Edit profil',
        () {
          Get.offAllNamed(Routes.DASHBOARD);
        },
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const WrapperImageUpdateProfil(),
              SizeApp.h36,
              const ListFormProfilUpdate(),
              const Spacer(),
              ButtonPrymary.isBlack(
                text: 'Simpan',
                onPressed: controller.updateProfil,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListFormProfilUpdate extends GetView<ProfileUpdateController> {
  const ListFormProfilUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          onTap: controller.alertJK,
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
    );
  }
}

class WrapperImageUpdateProfil extends GetView<ImageUpdateController>
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
