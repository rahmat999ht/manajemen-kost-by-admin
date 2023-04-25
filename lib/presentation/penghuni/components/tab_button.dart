import '../../../domain/core/core.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.c,
  }) : super(key: key);

  final PenghuniController c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Card(
        color: ColorApp.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            color: ColorApp.blueText,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: buttonTapBar(
                index: 0,
                activeColor: Colors.blue,
                color: Colors.white,
                title: c.listGedung[0],
              ),
            ),
            Expanded(
              child: buttonTapBar(
                activeColor: Colors.blue,
                color: Colors.white,
                index: 1,
                title: c.listGedung[1],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonTapBar({
    required int index,
    required Color activeColor,
    required Color color,
    required String title,
  }) {
    return GetX<PenghuniController>(
      init: PenghuniController(),
      builder: (controller) {
        return Card(
          elevation: 0,
          color: controller.selectionTab.value == index
              ? ColorApp.white
              : ColorApp.orange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            side: BorderSide.none,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 36,
                width: Get.width,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.changeSelectionTab(index),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          color: controller.selectionTab.value == index
                              ? ColorApp.blueText
                              : ColorApp.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
