import '../../../domain/core/core.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        title: const Text(
          '  for Admin',
          style: TextStyle(color: ColorApp.brown),
        ),
        elevation: 0.0,
      ),
      body: BodyLogin(
        c: controller,
      ),
    );
  }
}

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    super.key,
    required this.c,
  });

  final LoginController c;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: c.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizeApp.h100,
              const Content(
                'Home Stay',
                'Sign In',
                sizeTitle: 35,
                sizeSubTitle: 74,
                fontWeightSubTitle: FontWeight.bold,
              ),
              SizeApp.h30,
              TextForm.phone(
                isBg: true,
                isTitle: true,
                titel: "Your Phone",
                hintText: "Nomor Ponsel",
                controller: c.nomorPonsel,
                isCheck: true,
                color: ColorApp.grayForm,
              ),
              SizeApp.h30,
              Obx(
                () => ButtonPrymary(
                  onPressed: c.tapSelanjutnya,
                  text: 'Selanjutnya',
                  isLoading: c.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
