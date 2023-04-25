import 'dart:developer';

import '../../../../domain/core/core.dart';

class FormKamarController extends GetxController {
  // final penghuniController = Get.find<KamarController>();
  late KamarModel dataKamar;
  // List<PenghuniModel> listPenghuni = [];
  final isLoading = false.obs;

  final updateById = UpdateByID();

  final listJkl = [
    'Laki-laki',
    'Perempuan',
  ];
  final listStatus = [
    'Mahasiswa',
    'Karyawan',
    'Wiraswasta',
    'Lainnya',
  ];

  final formKey = GlobalKey<FormState>();
  final noKamar = Get.arguments;
  final hargaSebulan = TextEditingController();
  final hargaSetahun = TextEditingController();
  final RxList<List<TextEditingController>> listPenyewa = [
    <TextEditingController>[
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
  ].obs;

  void addTemanSekamar() {
    listPenyewa.add(
      <TextEditingController>[
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ],
    );
  }

  void deleteTemanSekamar(e) {
    listPenyewa.remove(e);
  }

  Future deleteTSbyID(String idPenghuni) async {
    DocumentReference<PenghuniModel> user = UtilsApp.firebaseFirestore
        .collection(UtilsApp.penghuniCollection)
        .doc(idPenghuni)
        .withConverter<PenghuniModel>(
          fromFirestore: (snapshot, options) =>
              PenghuniModel.fromMapId(snapshot.data()!, snapshot.id),
          toFirestore: (value, options) => value.toMap(),
        );
    final penghuni = await user.get();
    if (penghuni.exists) {
      updateById.updateKamarById(
        noKamar: noKamar,
        data: {
          'penghuni': FieldValue.arrayRemove([user]),
        },
      );
    }
  }

  final listFasilitas = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ].obs;

  void addFasilitas() {
    listFasilitas.add(
      TextEditingController(),
    );
  }

  void deleteFasilitas(e) {
    listFasilitas.remove(e);
  }

  Future alertJkl(int index) async {
    await alertValue(
      title: "Jenis Kelamin",
      listValue: listJkl,
      index: index,
      item: 2,
      listController: listPenyewa,
    );
  }

  Future alertStatus(int index) async {
    await alertValue(
      title: "Status",
      listValue: listStatus,
      index: index,
      item: 3,
      listController: listPenyewa,
    );
  }

  void initLoadingState() {
    isLoading.value = !isLoading.value;
  }

  String setValue(int index, int item, String value) {
    final data = listPenyewa[index];
    final fixData = data[item];
    return fixData.text = value;
  }

  String? getValue(int index, int item) {
    final value = listPenyewa.map(
      (element) {
        final data = element;
        final fixData = data[item];
        return fixData.text;
      },
    ).toList()[index];
    log(value);
    return value;
  }

  Future updateKamar() async {
    try {
      if (formKey.currentState!.validate()) {
        log("mulai");
        initLoadingState();
        for (int i = 0; i < listPenyewa.length; i++) {
          log(i.toString());
          log(listPenyewa.length.toString());
          final dataPenghuni = await UtilsApp.firebaseFirestore
              .collection(UtilsApp.penghuniCollection)
              .doc(getValue(i, 1) ?? '')
              .get();

//ketika id penghuni tidak di temukan.
//maka if di bawah akan di jalankan.
//dan if di bawah ini akan menambah data baru.
          if (!dataPenghuni.exists) {
            log("data 0", name: "Penghuni");
            updateById.setPenghuniById(
              idPenghuni: dataPenghuni.id,
              data: PenghuniModel(
                nama: getValue(i, 0) ?? '',
                noHp: getValue(i, 1) ?? '',
                jkl: getValue(i, 2) ?? '',
                status: getValue(i, 3) ?? '',
                peran: i == 0 ? "PJ" : "TS",
              ).toMap(),
            );
            // continue;
          }

//ketika id penghuni sama dengan nomor yg kita input .
//maka if di bawah akan di jalankan.
//dan if di bawah ini akan mengupdate data yg sudah ada di tabel penghuni berdasarkan id penghuni.
          if (dataPenghuni.exists) {
            log("data ${dataPenghuni.id}", name: "Penghuni");
            updateById.updatePenghuniById(
              idPenghuni: dataPenghuni.id,
              data: PenghuniModel(
                nama: getValue(i, 0) ?? '',
                noHp: getValue(i, 1) ?? '',
                jkl: getValue(i, 2) ?? '',
                status: getValue(i, 3) ?? '',
                peran: i == 0 ? "PJ" : "TS",
              ).toMap(),
            );
            // continue;
          }
          DocumentReference<PenghuniModel> user = UtilsApp.firebaseFirestore
              .collection(UtilsApp.penghuniCollection)
              .doc(dataPenghuni.id)
              .withConverter<PenghuniModel>(
                fromFirestore: (snapshot, options) =>
                    PenghuniModel.fromMapId(snapshot.data()!, snapshot.id),
                toFirestore: (value, options) => value.toMap(),
              );
          log("data $user", name: "Penghuni");
//kode di bawah ini akan mengupdate penghuni yg sudah ada di tabel kamar berdasarkan id kamar.
          updateById.updateKamarById(
            noKamar: noKamar,
            data: {
              'fasilitas': listFasilitas.map((e) => e.text).toList(),
              'sewa_bulanan': int.tryParse(hargaSebulan.text),
              'sewa_tahunan': int.tryParse(hargaSetahun.text),
              'penghuni': FieldValue.arrayUnion([user]),
            },
          );

          //kode di bawah ini akan mengupdate penghuni yg sudah ada di tabel kamar berdasarkan id kamar.
          if (dataKamar.penghuni != []) {
            updateById.updateKamarById(
              noKamar: noKamar,
              data: {
                'fasilitas': listFasilitas.map((e) => e.text).toList(),
                'sewa_bulanan': int.tryParse(hargaSebulan.text),
                'sewa_tahunan': int.tryParse(hargaSetahun.text),
                'penghuni': FieldValue.arrayUnion([user]),
                'tglSewa': Timestamp.now(),
              },
            );
          }

          DocumentReference<KamarModel> kamarDoc = UtilsApp.firebaseFirestore
              .collection(UtilsApp.naiveBayesCollection)
              .doc(noKamar)
              .withConverter<KamarModel>(
                fromFirestore: (snapshot, options) =>
                    KamarModel.fromMap(snapshot.data()!, snapshot.id),
                toFirestore: (value, options) => value.toMap(),
              );
          log("kamarDoc $kamarDoc", name: "Penghuni");
          final dataNaiveBayes = await UtilsApp.firebaseFirestore
              .collection(UtilsApp.penghuniCollection)
              .where("idKamar", isEqualTo: kamarDoc)
              .get();

          log("NaiveBayes ${dataNaiveBayes.size}", name: "Penghuni");
          if (dataNaiveBayes.size != 0) {
            updateById.addNaiveBayesById(
              data: {
                'idKamar': kamarDoc,
                'tglJatuhTempo': Timestamp.now(),
                'statusKamar': true,
                'riwayatPembayaran': [],
              },
            );
          }

          if (i + 1 == listPenyewa.length) {
            log('maximal 3');
            initLoadingState();
            Get.offAllNamed(Routes.DASHBOARD);
            alertActions(
              "Info",
              "Kamar dengan nomor ($noKamar) berhasil di perbarui",
              [
                ButtonOutline(
                  onPressed: Get.back,
                  text: 'Ok',
                ),
              ],
            );
          }
        }
      }
    } catch (e) {
      initLoadingState();
      log(e.toString());
      alertInfo("error", e.toString());
    }
  }

  @override
  void onInit() async {
    // listPenghuni = penghuniController.items;
    // log(listPenghuni.toString(), name: "list penghuni");
    final data = await UtilsApp.firebaseFirestore
        .collection(UtilsApp.kamarCollection)
        .doc(noKamar)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              KamarModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();
    log(data.data().toString(), name: 'kamar');
    dataKamar = data.data()!;
    initForm(
      penyewa: dataKamar.penghuni,
      sewaBulanan: dataKamar.sewaBulanan.toString(),
      sewaTahunan: dataKamar.sewaTahunan.toString(),
      fasilitas: dataKamar.fasilitas as List<String>,
    );

    super.onInit();
  }

  void initForm({
    final List<DocumentReference<PenghuniModel>>? penyewa,
    final String? sewaBulanan,
    final String? sewaTahunan,
    final List<String>? fasilitas,
  }) async {
    penyewa == null || penyewa.isEmpty
        ? listPenyewa.length
        : listPenyewa.value = penyewa.map((e) {
            // listPenghuni.first.id == e.id;
            return [
              TextEditingController(text: e.id),
              TextEditingController(text: e.id),
              TextEditingController(text: e.id),
              TextEditingController(text: e.id),
            ];
          }).toList();
    sewaBulanan == null ? null : hargaSebulan.text = sewaBulanan;
    sewaTahunan == null ? null : hargaSetahun.text = sewaTahunan;
    fasilitas == null || fasilitas.isEmpty
        ? listFasilitas.length
        : listFasilitas.value = fasilitas
            .map(
              (e) => TextEditingController(text: e),
            )
            .toList();
  }
}
