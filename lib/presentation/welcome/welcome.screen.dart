import '../../domain/core/core.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        c: controller,
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.c,
  });

  final WelcomeController c;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Image.asset(
          Assets.illustration,
          fit: BoxFit.contain,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imgWelcome,
              fit: BoxFit.cover,
              width: 326,
              height: 251,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Content(
                    'Welcome to',
                    'Home Stay',
                    sizeTitle: 25,
                    sizeSubTitle: 56,
                    styleTitle: FontStyle.italic,
                    fontWeightSubTitle: FontWeight.bold,
                  ),
                  SizeApp.h12,
                  Content(
                    c.kelola,
                    c.anda,
                    space: 30.0,
                    colorTitle: ColorApp.gray,
                    colorSubTitle: ColorApp.gray,
                  ),
                  SizeApp.h40,
                  ButtonPrymary(
                    text: 'Get Started',
                    onPressed: c.tapStart,
                  ),
                ],
              ),
            ),
            SizeApp.h100,
          ],
        ),
      ],
    );
  }
}
