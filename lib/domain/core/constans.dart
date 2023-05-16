import 'core.dart';

class ConstansApp {
  static final firebaseFirestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static const noKamarCollection = "no_kamar";
  static const adminCollection = "admin";
  static const penghuniCollection = "penghuni";
  static const kamarCollection = "kamar";
  static const naiveBayesCollection = "naive_bayes";
  static const pemasukanCollection = "pemasukan";
  static const pengeluaranCollection = "pengeluaran";
  static final idLogin = Get.find<DashboardController>().adminModel!.id!;

  static final storageRef = FirebaseStorage.instance.ref();

  static final metadata = SettableMetadata(contentType: "image/jpeg");
}
