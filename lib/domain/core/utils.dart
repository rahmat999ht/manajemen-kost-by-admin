import 'core.dart';

class UtilsApp {
  static final firebaseFirestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static const noKamarCollection = "no_kamar";
  static const adminCollection = "admin";

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
}
