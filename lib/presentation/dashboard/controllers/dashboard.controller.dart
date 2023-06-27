import 'dart:developer';
import 'dart:isolate';

import 'package:flutter_isolate/flutter_isolate.dart';

import '../../../domain/core/core.dart';

class DashboardController extends GetxController with StateMixin<AdminModel> {
  final RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions = <Widget>[];
  bool toogle = true;
  final isLoading = true.obs;
  AdminModel? adminModel;
  late final List<AdminModel> dataAdmin;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void toPenghuni() {
    Get.toNamed(Routes.PENGHUNI);
  }

  void toPemasukan() {
    Get.toNamed(Routes.FORM_PEMASUKAN);
  }

  void toPengeluaran() {
    Get.toNamed(Routes.FORM_PENGELUARAN);
  }

  void sendMessageToTopic() async {
    await FirebaseMessaging.instance.sendMessage(
      to: '/topics/${adminModel?.id}',
      data: {
        'title': 'Pesan Baru',
        'body': 'Ini adalah pesan ke topik ID Login = ${adminModel?.id}',
      },
    );
  }

  void backgroundFunction(SendPort sendPort) {
    // Inisialisasi Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Fungsi ini akan berjalan di latar belakang
    // Anda dapat menambahkan kode logika atau operasi yang diinginkan di sini

    // Contoh: Memperbarui data di Firestore
    void updateData() async {
      try {
        DocumentReference documentRef =
            firestore.collection('your_collection').doc('your_document_id');

        await documentRef.update({
          'field1': 'new_value1',
          'field2': 'new_value2',
          // tambahkan bidang lain yang ingin Anda perbarui
        });

        // Mengirim pesan ke isolate utama
        sendPort.send('Data updated successfully!');
      } catch (error) {
        // Mengirim pesan ke isolate utama
        sendPort.send('Error updating data: $error');
      }
    }

    updateData();
  }

  // void startBackgroundFunction() async {
  //   // Membuat SendPort untuk berkomunikasi dengan isolate
  //   ReceivePort receivePort = ReceivePort();

  //   // Membuat isolate dan memberikan sendPort sebagai argumen
  //   FlutterIsolate isolate =
  //       await FlutterIsolate.spawn(backgroundFunction, receivePort.sendPort);

  //   // Mendengarkan pesan dari isolate
  //   receivePort.listen((message) {
  //     // Menerima pesan dari isolate di sini
  //     log('Received message from isolate: $message');
  //   });
  // }

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    String? isId = prefs.getString("user_id") ?? '';
    log(isId);
    final dataAllUser = await ConstansApp.firebaseFirestore
        .collection(ConstansApp.adminCollection)
        .get();
    dataAdmin = dataAllUser.docs
        .map((e) => AdminModel.fromDocumentSnapshot(e))
        .toList();

    var dataUserModel = dataAllUser.docs.firstWhere((e) => e.id == isId);
    adminModel = AdminModel.fromDocumentSnapshot(dataUserModel);
    successState(adminModel!);
    if (Get.arguments != null) {
      selectedIndex.value = Get.arguments["selectedIndex"] ?? 0;
    }
    widgetOptions = [
      const HomeScreen(),
      const CalenderScreen(),
      const ListPenghuniScreen(),
      const ProfilScreen(),
    ];
    super.onInit();
  }

  void loadingState() {
    change(
      null,
      status: RxStatus.loading(),
    );
  }

  void successState(AdminModel adminModel) {
    change(
      adminModel,
      status: RxStatus.success(),
    );
  }
}
