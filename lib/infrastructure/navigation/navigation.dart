import '../../domain/core/core.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeScreen(),
      binding: WelcomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.VERIFIKASI,
      page: () => const VerifikasiScreen(),
      binding: VerifikasiControllerBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.CALENDER,
      page: () => const CalenderScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_PENGHUNI,
      page: () => const ListPenghuniScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => const ProfilScreen(),
      binding: DashboardControllerBinding(),
    ),
  ];
}
