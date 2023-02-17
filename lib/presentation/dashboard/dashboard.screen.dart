import '../../domain/core/core.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Obx(
          () => controller.widgetOptions.elementAt(
            controller.selectedIndex.value,
          ),
        ),
        onLoading: const LaodingState(),
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
                icon: Assets.home,
                iconActive: Assets.home2,
              ),
              const Spacer(),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 1,
                icon: Assets.calendar,
                iconActive: Assets.calendar2,
              ),
              const Spacer(
                flex: 4,
              ),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 2,
                icon: Assets.listPenghuni,
                iconActive: Assets.listPenghuni2,
              ),
              const Spacer(),
              ButtonNavBar(
                isClickabel: controller.isLoading.value,
                activeColor: ColorApp.orange,
                color: ColorApp.white,
                index: 3,
                icon: Assets.profile,
                iconActive: Assets.profile2,
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
                      Assets.elementplus,
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
