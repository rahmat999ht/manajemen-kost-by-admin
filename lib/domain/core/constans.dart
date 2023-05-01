import 'core.dart';

class ConstansApp {
  static final firebaseFirestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static const noKamarCollection = "no_kamar";
  static const adminCollection = "admin";
  static const penghuniCollection = "penghuni";
  static const kamarCollection = "kamar";
  static const naiveBayesCollection = "naive_bayes";
  static final idLogin = Get.find<DashboardController>().adminModel!.id!;
}
