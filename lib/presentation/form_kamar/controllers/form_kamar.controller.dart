import 'dart:developer';

import '../../../domain/core/core.dart';

class FormKamarController extends GetxController {
  final isLoading = false.obs;

  final listJkl = [
    'Laki-laki',
    'Perempuan',
  ];
  final listStatus = ['Mahasiswa', 'Karyawan', 'Wiraswasta', 'Lainnya'];

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

  final listFasilitas = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
  ].obs;

  void addInfoKamar() {
    listFasilitas.add(
      TextEditingController(),
    );
  }

  void deleteInfoKamar(e) {
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

  Future<String> setValue(int index, int item, String value) async {
    final data = listPenyewa[index];
    final fixData = data[item];
    return fixData.text = value;
  }

  Future<String> getValue(int index, int item) async {
    final value = listPenyewa.map(
      (element) async {
        final data = element;
        final fixData = data[item];
        return fixData.text;
      },
    ).toList()[index];
    log(await value);
    return value;
  }

  Future updateKamar() async {
    try {
      if (formKey.currentState!.validate()) {
        log("mulai");
        initLoadingState();
        UtilsApp.firebaseFirestore
            .collection(UtilsApp.kamarCollection)
            .doc(noKamar)
            .update(
          {
            'fasilitas': listFasilitas.map((e) => e.text).toList(),
            'sewa_bulanan': int.tryParse(hargaSebulan.text),
            'sewa_tahunan': int.tryParse(hargaSetahun.text),
            'penghuni': listPenyewa.map(
              (element) async {
                final e = element;
                PenghuniModel(
                  nama: e[0].text,
                  noHp: e[1].text,
                  jkl: e[2].text,
                  status: e[3].text,
                ).toMap();
              },
            ).toList(),
          },
        );
        for (int i = 0; i < listPenyewa.length; i++) {
          log(i.toString());
          log(listPenyewa.length.toString());
          final dataPenghuni = await UtilsApp.firebaseFirestore
              .collection(UtilsApp.penghuniCollection)
              .where(
                "noHp",
                isEqualTo: getValue(i, 1),
              )
              .get();
          // if (dataPenghuni.size != 0) {
          UtilsApp.firebaseFirestore
              .collection(UtilsApp.penghuniCollection)
              .doc(dataPenghuni.docs.last.id)
              .update(
                PenghuniModel(
                  nama: await getValue(i, 0),
                  noHp: await getValue(i, 1),
                  jkl: await getValue(i, 2),
                  status: await getValue(i, 3),
                ).toMap(),
              );
          if (i + 1 == listPenyewa.length) {
            log('maximal');
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
            return;
          }
          //   return;
          // }
          if (dataPenghuni.size == 0) {
            log("data 0");
            UtilsApp.firebaseFirestore
                .collection(UtilsApp.penghuniCollection)
                .add(
                  PenghuniModel(
                    nama: await getValue(i, 0),
                    noHp: await getValue(i, 1),
                    jkl: await getValue(i, 2),
                    status: await getValue(i, 3),
                  ).toMap(),
                );
            if (i == listPenyewa.length) {
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
            return;
          }
        }
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
    } catch (e) {
      initLoadingState();
      log(e.toString());
      alertInfo("error", e.toString());
    }
  }

  @override
  void onInit() async {
    final dataKamar = await UtilsApp.firebaseFirestore
        .collection(UtilsApp.kamarCollection)
        .doc(noKamar)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              KamarModel.fromDocumentSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();
    log(dataKamar.data().toString());
    final data = dataKamar.data();
    initForm(
      penyewa: data!.penghuni,
      sewaBulanan: data.sewaBulanan.toString(),
      sewaTahunan: data.sewaTahunan.toString(),
      fasilitas: data.fasilitas as List<String>,
    );

    super.onInit();
  }

  void initForm({
    final List<DocumentReference<PenghuniModel>>? penyewa,
    final String? sewaBulanan,
    final String? sewaTahunan,
    final List<String>? fasilitas,
  }) async {
    penyewa == null && penyewa!.isEmpty
        ? null
        : listPenyewa.value = penyewa.map((e) {
            return [
              TextEditingController(text: e.id),
              TextEditingController(text: e.id),
              TextEditingController(text: e.id),
              TextEditingController(text: e.id),
            ];
          }).toList();
    sewaBulanan == null ? null : hargaSebulan.text = sewaBulanan;
    sewaTahunan == null ? null : hargaSetahun.text = sewaTahunan;
    fasilitas == null && fasilitas!.isEmpty
        ? null
        : listFasilitas.value = fasilitas
            .map(
              (e) => TextEditingController(text: e),
            )
            .toList();
  }
}
