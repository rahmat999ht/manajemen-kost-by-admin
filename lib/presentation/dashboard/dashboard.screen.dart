import '../../domain/core/core.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.widgetOptions.elementAt(
          controller.selectedIndex.value,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          color: ColorApp.white,
          child: Row(
            children: [
              const Spacer(),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 0,
                icon: 'assets/icons/home.svg',
                iconActive: 'assets/icons/home2.svg',
              ),
              const Spacer(),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 1,
                icon: 'assets/icons/calendar.svg',
                iconActive: 'assets/icons/calendar2.svg',
              ),
              const Spacer(
                flex: 4,
              ),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 2,
                icon: 'assets/icons/list-penghuni.svg',
                iconActive: 'assets/icons/list-penghuni2.svg',
              ),
              const Spacer(),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 3,
                icon: 'assets/icons/profile.svg',
                iconActive: 'assets/icons/profile2.svg',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => controller.isLoading.isFalse
            ? Container(
                decoration: BoxDecoration(
                  color: ColorApp.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 50.0,
                width: 50.0,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.black54,
                    child: SvgPicture.asset(
                      'assets/icons/elementplus.svg',
                      // size: 60,
                    ),
                  ),
                ),
              )
            : const FAB(),
      ),
    );
  }
}
