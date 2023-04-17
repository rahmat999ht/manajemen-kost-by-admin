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
        onLoading: const LoadingState(),
      ),
      bottomNavigationBar: const BottomBar(),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => controller.isLoading.isFalse ? const FabEmpty() : const FAB(),
      ),
    );
  }
}
