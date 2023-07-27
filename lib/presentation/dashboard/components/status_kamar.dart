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
      naiveBayesModel.statusKamar == false
          ? StreamBuilder<DocumentSnapshot<KamarModel>>(
              stream: methodApp.kamar(naiveBayesModel.idKamar!.id).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final dataKamar = snapshot.data!.data()!;
                  return Column(
                    children: [
                      Text(
                        'Status Kamar Saat ini sudah melewati masa pembayaran yang jatuh tempo pada tanggal ${tgl.day} - $month - ${tgl.year}',
                      ),
                      SizeApp.h20,
                      ButtonPrymary(
                        text: 'Aktifkan status kamar',
                        onPressed: () {
                          // tgl jatuh tempo sebelumnya
                          var jatuhTempo =
                              naiveBayesModel.tglJatuhTempo!.toDate();
                          // Menambah satu bulan ke variabel jatuhTempo
                          var tambahSebulan =
                              jatuhTempo.add(const Duration(days: 30));
                          // Mengonversi tambahSebulan kembali menjadi Timestamp
                          var tambahSebulanTimestamp =
                              Timestamp.fromDate(tambahSebulan);

                          // kode ini akan mengupdate statusKamar menjadi aktif
                          // dan memperpanjang tgl jatuh tempo selama satu bulan
                          methodApp.updateNaiveBayesById(
                            idNaiveBayes: naiveBayesModel.idNaiveBayes,
                            data: {
                              'statusKamar': true,
                              'tglJatuhTempo': tambahSebulanTimestamp,
                            },
                          );
                        },
                      ),
                      SizeApp.h10,
                      ButtonPrymary(
                        text: 'Kosongkan kamar',
                        bgColor: ColorApp.red,
                        onPressed: () {
                          // kode ini akan mengubah statusKamar menjadi tidak aktif
                          // dan kondisi terisi menjadi false atau kosong
                          // pada tabel naiveBayes
                          methodApp.updateNaiveBayesById(
                            idNaiveBayes: naiveBayesModel.idNaiveBayes,
                            data: {
                              'terisi': false,
                              'statusKamar': false,
                            },
                          );

                          // kode ini akan mengosongkan list penghuni
                          // pada tabel kamar
                          // sesuai nomor kamar pada tabel naiveBayes
                          methodApp.updateKamarById(
                            noKamar: naiveBayesModel.idKamar!.id,
                            data: {
                              'penghuni': FieldValue.delete(),
                            },
                          );

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
                        },
                      ),
                    ],
                  );
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
          : Column(
              children: [
                Text(
                  'Status Kamar Saat ini masih aktif, dan akan jatuh tempo pada tanggal ${tgl.day} - $month - ${tgl.year}',
                ),
                SizeApp.h100,
              ],
            ),
    ],
  );
}
