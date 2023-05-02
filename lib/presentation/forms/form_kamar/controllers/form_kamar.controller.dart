import 'dart:developer';

import '../../../../domain/core/core.dart';

class FormKamarController extends GetxController {
  // final penghuniController = Get.find<KamarController>();
  KamarModel? dataKamar;
  // List<PenghuniModel> listPenghuni = [];
  final isLoading = false.obs;

  final methodApp = MethodApp();

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

  // void deleteTemanSekamar(List<TextEditingController> e) {
  //   listPenyewa.remove(e);
  // }

  Future deleteTSbyID(List<TextEditingController> e) async {
    final idPenghuni = e[1].text;
    DocumentReference<PenghuniModel> user = methodApp.penghuni(idPenghuni);
    final penghuni = await user.get();
    if (penghuni.exists) {
      alertActions(
        'Peringatan',
        'dengan menghapus form ini\nmaka akan menghapus data yang sudah ada sebelumnya.',
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonOutline(
                width: 50,
                onPressed: () {
                  Get.back();
                },
                text: 'No',
              ),
              SizeApp.w10,
              ButtonOutline(
                width: 50,
                onPressed: () {
                  methodApp.updateKamarById(
                    noKamar: noKamar,
                    data: {
                      'penghuni': FieldValue.arrayRemove([user]),
                    },
                  );
                  methodApp.updatePenghuniById(
                    idPenghuni: idPenghuni,
                    data: {
                      'isAktif': false,
                    },
                  );
                  listPenyewa.remove(e);
                  Get.back();
                  Get.snackbar(
                    "Info",
                    'berhasil menghapus Teman sekamar',
                  );
                },
                text: 'Yes',
              ),
            ],
          )
        ],
      );
    } else {
      listPenyewa.remove(e);
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
    await alertValueFormKamar(
      title: "Jenis Kelamin",
      listValue: listJkl,
      index: index,
      item: 2,
      listController: listPenyewa,
    );
  }

  Future alertStatus(int index) async {
    await alertValueFormKamar(
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

  String getValue(int index, int item) {
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
          final dataPenghuni = await ConstansApp.firebaseFirestore
              .collection(ConstansApp.penghuniCollection)
              .doc(getValue(i, 1))
              .get();

//kode di bawah ini akan mendaftarkan nomor penanggung jabab sebagai akun terdaftar
//akun tersebut dapat di pake untuk login di app khusus penghuni kost
          if (i == 0) {
            log(
              "nomor di daftarkan : ${listPenyewa[i][1].text}",
              name: "Penghuni",
            );
            methodApp.regAdmin(formKey, listPenyewa[i][1]);
          }
//ketika id penghuni tidak di temukan.
//maka if di bawah akan di jalankan.
//dan if di bawah ini akan menambah data baru.
          if (!dataPenghuni.exists) {
            log("data 0", name: "Penghuni");
            methodApp.setPenghuniById(
              idPenghuni: dataPenghuni.id,
              data: PenghuniModel(
                nama: getValue(i, 0),
                noHp: getValue(i, 1),
                jkl: getValue(i, 2),
                status: getValue(i, 3),
                peran: i == 0 ? "PJ" : "TS",
                isAktif: true,
              ).toMap(),
            );
            // continue;
          }

//ketika id penghuni sama dengan nomor yg kita input .
//maka if di bawah akan di jalankan.
//dan if di bawah ini akan mengupdate data yg sudah ada di tabel penghuni berdasarkan id penghuni.
          if (dataPenghuni.exists) {
            log("data ${dataPenghuni.id}", name: "Penghuni");
            methodApp.updatePenghuniById(
              idPenghuni: dataPenghuni.id,
              data: PenghuniModel(
                nama: getValue(i, 0),
                noHp: getValue(i, 1),
                jkl: getValue(i, 2),
                status: getValue(i, 3),
                peran: i == 0 ? "PJ" : "TS",
                isAktif: true,
              ).toMap(),
            );
            // continue;
          }
          DocumentReference<PenghuniModel> user =
              methodApp.penghuni(dataPenghuni.id);

          log("data $user", name: "Penghuni");
//kode di bawah ini akan mengupdate penghuni yg sudah ada di tabel kamar berdasarkan id kamar.
          if (dataKamar!.penghuni!.isNotEmpty) {
            methodApp.updateKamarById(
              noKamar: noKamar,
              data: {
                'fasilitas': listFasilitas.map((e) => e.text).toList(),
                'sewa_bulanan': int.tryParse(hargaSebulan.text),
                'sewa_tahunan': int.tryParse(hargaSetahun.text),
                'penghuni': FieldValue.arrayUnion([user]),
              },
            );
          } else {
// kode di bawah ini akan mengupdate penghuni yg sudah ada di tabel kamar berdasarkan id kamar.
// dan sekaligus mengupdate tanggal sewa jika list penghuninya masih kosong,
            methodApp.updateKamarById(
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

          DocumentReference<KamarModel> kamarDoc = methodApp.kamar(noKamar);

          log("kamarDoc $kamarDoc", name: "Penghuni");
          final dataNaiveBayes = await ConstansApp.firebaseFirestore
              .collection(ConstansApp.naiveBayesCollection)
              .where("idKamar", isEqualTo: kamarDoc)
              .get();

          log("NaiveBayes ${dataNaiveBayes.size}", name: "Penghuni");

          if (dataNaiveBayes.size == 0) {
            Timestamp currentTimestamp = Timestamp.now();
            // Mendapatkan tanggal saat ini
            DateTime currentDate = currentTimestamp.toDate();
            // Menambahkan satu bulan ke tanggal saat ini
            DateTime newDate = currentDate.add(const Duration(days: 30));
            // Mengonversi kembali ke Timestamp
            Timestamp timeNowPlusSebulan = Timestamp.fromDate(newDate);

            methodApp.addNaiveBayesById(
              data: {
                'idKamar': kamarDoc,
                'tglJatuhTempo': timeNowPlusSebulan,
                'statusKamar': true,
                'riwayatPembayaran': [],
              },
            );
            log('Timestamp setelah ditambah satu bulan: $timeNowPlusSebulan',
                name: "tanggal");
          } else {
            methodApp.updateNaiveBayesById(
              idNaiveBayes: dataNaiveBayes.docs.first.id,
              data: {
                'statusKamar': true,
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
    final data = await methodApp.kamar(noKamar).get();
    log(data.data().toString(), name: 'kamar');
    dataKamar = data.data();
    initForm(
      penyewa: dataKamar?.penghuni,
      sewaBulanan: dataKamar?.sewaBulanan.toString(),
      sewaTahunan: dataKamar?.sewaTahunan.toString(),
      fasilitas: dataKamar?.fasilitas,
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
