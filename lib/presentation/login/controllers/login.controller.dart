import '../../../domain/core/core.dart';

class LoginController extends GetxController {
  final nomorPonsel = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;

  void isLoadingChange() {
    isLoading.value = !isLoading.value;
  }

  void tapLogin() {
    Get.toNamed(Routes.VERIFIKASI);
  }
}
