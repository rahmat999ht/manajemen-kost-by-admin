import '../../../domain/core/core.dart';

class ButtonNavBar extends GetView<DashboardController> {
  final int index;
  final Color activeColor;
  final Color color;
  final String icon;
  final String iconActive;
  final bool isClickabel;
  const ButtonNavBar({
    required this.icon,
    required this.iconActive,
    required this.index,
    this.isClickabel = true,
    required this.activeColor,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              color: controller.selectedIndex.value == index
                  ? ColorApp.orange
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        Obx(
          () => IconButton(
            icon: SvgPicture.asset(
              controller.selectedIndex.value == index ? iconActive : icon,
              height: 25,
              // color: Colors.white,
            ),
            onPressed: isClickabel
                ? () {
                    controller.selectedIndex.value = index;
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
