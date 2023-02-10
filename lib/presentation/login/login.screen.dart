import 'package:manajemen_kost_by_admin/domain/interfaces/forms/form.dart';

import '../../domain/core/core.dart';

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
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key: c.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Home Stay',
              style: TextStyle(
                fontSize: 35,
                color: ColorApp.brown,
              ),
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 74,
                fontWeight: FontWeight.bold,
                color: ColorApp.brown,
              ),
            ),
            SizeApp.h30,
            TextForm.phone(
              isTitle: true,
              titel: "Your Phone",
              hintText: "Nomor Ponsel",
              controller: c.nomorPonsel,
              isCheck: true,
              color: ColorApp.grayForm,
            ),
            SizeApp.h30,
            ButtonPrymary(
              onPressed: () {},
              text: 'Login',
            ),
            SizeApp.h100,
          ],
        ),
      ),
    );
  }
}
