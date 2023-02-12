import 'dart:developer';

import 'domain/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? isviewed = prefs.getBool("isStart") ?? false;
  log(prefs.getBool("isStart").toString());
  String initialRoute = isviewed == true ? Routes.LOGIN : Routes.WELCOME;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
