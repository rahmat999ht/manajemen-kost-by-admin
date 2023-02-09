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
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: ColorApp.brown,
                    ),
                  ),
                  const Text(
                    'Home Stay',
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.brown,
                    ),
                  ),
                  SizeApp.h12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.kelola,
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: ColorApp.gray,
                        ),
                      ),
                      SizeApp.h20,
                      Text(
                        c.anda,
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: ColorApp.gray,
                        ),
                      ),
                    ],
                  ),
                  SizeApp.h30,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.orange,
                        fixedSize: Size(SizeApp.wFull, 50)),
                    onPressed: () {},
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
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
