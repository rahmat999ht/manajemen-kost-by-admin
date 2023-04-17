import 'core.dart';

class UtilsApp {
  static final firebaseFirestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static const noKamarCollection = "no_kamar";
  static const adminCollection = "admin";
  static const penghuniCollection = "penghuni";
  static const kamarCollection = "kamar";
  static final idLogin = Get.find<DashboardController>().adminModel!.id!;

  static DocumentReference<NoKamarModel> noKamar(String id) {
    return UtilsApp.firebaseFirestore
        .collection(UtilsApp.noKamarCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              NoKamarModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  static DocumentReference<AdminModel> admin(String id) {
    return UtilsApp.firebaseFirestore
        .collection(UtilsApp.adminCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              AdminModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }

  static DocumentReference<PenghuniModel> penghuni(String idUser) {
    return UtilsApp.firebaseFirestore
        .collection(UtilsApp.penghuniCollection)
        .doc(idUser)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                PenghuniModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }
}
