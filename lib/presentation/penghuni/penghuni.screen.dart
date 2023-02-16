import '../../domain/core/core.dart';

class PenghuniScreen extends GetView<PenghuniController> {
  const PenghuniScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.orange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.orange,
        title: TabButton(
          c: controller,
        ),
        automaticallyImplyLeading: false,
      ),
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: 2,
        onPageChanged: (value) => controller.selectionTab.value = value,
        itemBuilder: (context, index) {
          if (index == 0) {
            return PageGedung(
              gedung: controller.listGedung[0],
            );
          } else {
            return PageGedung(
              gedung: controller.listGedung[1],
            );
          }
        },
      ),
    );
  }
}
