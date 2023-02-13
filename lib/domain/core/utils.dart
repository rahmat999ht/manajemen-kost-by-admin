import 'core.dart';

class UtilsApp {
  static final firebaseFirestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static const kamarCollection = "no_kamar";

  static DocumentReference<NoKamarModel> noKamar(String id) {
    return UtilsApp.firebaseFirestore
        .collection(UtilsApp.kamarCollection)
        .doc(id)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              NoKamarModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        );
  }
}
