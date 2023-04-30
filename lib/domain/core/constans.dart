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

  static DocumentReference<NoKamarModel> noKamar(String id) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.noKamarCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              NoKamarModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  static DocumentReference<AdminModel> admin(String id) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.adminCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              AdminModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  static DocumentReference<PenghuniModel> penghuni(String idUser) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idUser)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                PenghuniModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }

  static DocumentReference<KamarModel> kamar(String idKamar) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.kamarCollection)
        .doc(idKamar)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                KamarModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }
}
