import '../../../../../../domain/core/core.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBatal('Edit profil', Get.back),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizeApp.h36,
                  WrapperImageUpdateProfil(
                    image: controller.adminModel.foto,
                  ),
                  SizeApp.h36,
                  const ListFormProfilUpdate(),
                  SizeApp.h50,
                  ButtonPrymary.isBlack(
                    text: 'Simpan',
                    onPressed: controller.updateProfil,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
