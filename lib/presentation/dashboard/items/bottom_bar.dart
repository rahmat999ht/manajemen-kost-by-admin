import '../../../domain/core/core.dart';

class BottomBar extends GetView<DashboardController> {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
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
    );
  }
}
