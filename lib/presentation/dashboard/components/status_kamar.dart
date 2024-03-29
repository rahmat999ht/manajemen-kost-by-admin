import '../../../domain/core/core.dart';

Future statusKamar(
  BuildContext context,
  NaiveBayesModel naiveBayesModel,
) async {
  final controller = Get.find<HomeController>();
  MethodApp methodApp = MethodApp();
  final tgl = naiveBayesModel.tglJatuhTempo!.toDate();
  final month = controller.months[tgl.month - 1];
  return await buttonSheet(
    context: context,
    title: "Status Kamar",
    content: <Widget>[
      StreamBuilder<DocumentSnapshot<KamarModel>>(
        stream: methodApp.kamar(naiveBayesModel.idKamar!.id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataKamar = snapshot.data!.data()!;
            if (naiveBayesModel.statusKamar == false) {
              return Column(
                children: [
                  Text(
                    'Status Kamar Saat ini sudah melewati masa pembayaran yang jatuh tempo pada tanggal ${tgl.day} - $month - ${tgl.year}',
                  ),
                  SizeApp.h20,
                  ButtonPrymary(
                    text: 'Aktifkan status kamar',
                    onPressed: () {
                      alertContent(
                        title: 'pilih masa perpanjangan',
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ButtonOutline(
                                onPressed: () {
                                  aktivasiKamar(
                                    methodApp,
                                    naiveBayesModel,
                                    dataKamar,
                                    true,
                                  );
                                },
                                text: '1 Tahun',
                              ),
                              const SizedBox(height: 8),
                              ButtonOutline(
                                onPressed: () {
                                  aktivasiKamar(
                                    methodApp,
                                    naiveBayesModel,
                                    dataKamar,
                                    false,
                                  );
                                },
                                text: '1 Bulan',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizeApp.h10,
                  ButtonPrymary(
                    text: 'Kosongkan kamar',
                    bgColor: ColorApp.red,
                    onPressed: () {
                      kosongkanKamar(
                        methodApp,
                        naiveBayesModel,
                        dataKamar,
                      );
                    },
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Text(
                    'Status Kamar Saat ini masih aktif, dan akan jatuh tempo pada tanggal ${tgl.day} - $month - ${tgl.year}',
                  ),
                  SizeApp.h60,
                  ButtonPrymary(
                    text: 'Perpanjang sewa kamar',
                    onPressed: () {
                      alertContent(
                        title: 'pilih masa perpanjangan',
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ButtonOutline(
                                onPressed: () {
                                  aktivasiKamar(
                                    methodApp,
                                    naiveBayesModel,
                                    dataKamar,
                                    true,
                                  );
                                },
                                text: '1 Tahun',
                              ),
                              const SizedBox(height: 8),
                              ButtonOutline(
                                onPressed: () {
                                  aktivasiKamar(
                                    methodApp,
                                    naiveBayesModel,
                                    dataKamar,
                                    false,
                                  );
                                },
                                text: '1 Bulan',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          } else {
            return const Column(
              children: [
                Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text('Proses ....'),
                  ],
                ),
                SizeApp.h100,
              ],
            );
          }
        },
      )
    ],
  );
}

void aktivasiKamar(
  MethodApp methodApp,
  NaiveBayesModel naiveBayesModel,
  KamarModel dataKamar,
  bool isSetahun,
) {
// tgl jatuh tempo sebelumnya
  var jatuhTempo = naiveBayesModel.tglJatuhTempo!.toDate();
  // Menambah satu bulan ke variabel jatuhTempo
  var tambahSebulan = jatuhTempo;
  if (isSetahun == true) {
    tambahSebulan = jatuhTempo.add(const Duration(days: 365));
    DocumentReference<KamarModel> idKamar = methodApp.kamar(dataKamar.id!);
    methodApp.addPemasukan(
      data: PemasukanModel(
        foto: null,
        jenis: 'Sewa 1 Tahun',
        idr: dataKamar.sewaTahunan!,
        idKamar: idKamar,
        dateUpload: Timestamp.now(),
      ).toMapNoImage(),
    );
  } else {
    tambahSebulan = jatuhTempo.add(const Duration(days: 30));
    DocumentReference<KamarModel> idKamar = methodApp.kamar(dataKamar.id!);
    methodApp.addPemasukan(
      data: PemasukanModel(
        foto: null,
        jenis: 'Sewa 1 Bulan',
        idr: dataKamar.sewaBulanan!,
        idKamar: idKamar,
        dateUpload: Timestamp.now(),
      ).toMapNoImage(),
    );
  }
  // Mengonversi tambahSebulan kembali menjadi Timestamp
  var tambahSebulanTimestamp = Timestamp.fromDate(tambahSebulan);

  // kode ini akan mengupdate statusKamar menjadi aktif
  // dan memperpanjang tgl jatuh tempo selama satu bulan
  methodApp.updateNaiveBayesById(
    idNaiveBayes: naiveBayesModel.idNaiveBayes,
    data: {
      'statusKamar': true,
      'tglJatuhTempo': tambahSebulanTimestamp,
    },
  );
  Get.back();
  Get.back();
}

void kosongkanKamar(
  MethodApp methodApp,
  NaiveBayesModel naiveBayesModel,
  KamarModel dataKamar,
) {
  // kode ini akan menonaktifkan status penghuni menjadi tidak aktif
  // pada tabel penghuni
  // sesuai ID penghuni yg terdaftar sesuai nomor kamar pada tabel naiveBayes
  // yang artinya sudah tidak berstatus penghuni lagi
  for (var element in dataKamar.penghuni!) {
    methodApp.updatePenghuniById(
      idPenghuni: element.id,
      data: {
        'isAktif': false,
      },
    );
  }
  // kode ini akan mengubah statusKamar menjadi  false atau tidak aktif
  // kondisi terisi menjadi false atau kosong
  // tgl jatuh tempo di kosongkan
  // riwayat bermasalah di kosongkan atua di perbarui
  // pada tabel naiveBayes
  methodApp.updateNaiveBayesById(
    idNaiveBayes: naiveBayesModel.idNaiveBayes,
    data: {
      'terisi': false,
      'statusKamar': false,
      'tglJatuhTempo': null,
      'riwayatBermasalah': [],
    },
  );

  // kode ini akan mengosongkan list penghuni
  // pada tabel kamar
  // sesuai nomor kamar pada tabel naiveBayes
  methodApp.updateKamarById(
    noKamar: naiveBayesModel.idKamar!.id,
    data: {
      'penghuni': [],
    },
  );
  Get.back();
}
