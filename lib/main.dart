import 'dart:developer';

import 'domain/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? isviewed = prefs.getBool("isStart") ?? false;
  String? isId = prefs.getString("user_id") ?? '';
  log(prefs.getBool("isStart").toString());
  log(isId);
  String isLogin = isId == '' ? Routes.LOGIN : Routes.DASHBOARD;
  String initialRoute = isviewed == true ? isLogin : Routes.WELCOME;

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
