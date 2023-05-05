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
    content: naiveBayesModel.statusKamar == false
        ? <Widget>[
            Text(
              'Status Kamar Saat ini sudah melewati masa pembayaran yang jatuh tempo pada tanggal ${tgl.day} - $month - ${tgl.year}',
            ),
            SizeApp.h20,
            ButtonPrymary(
              text: 'Aktifkan status kamar',
              onPressed: () {
                methodApp.updateNaiveBayesById(
                  idNaiveBayes: naiveBayesModel.idNaiveBayes,
                  data: {
                    'statusKamar': true,
                  },
                );
              },
            ),
            SizeApp.h10,
            ButtonPrymary(
              text: 'Kosongkan kamar',
              bgColor: ColorApp.red,
              onPressed: () {
                methodApp.updateNaiveBayesById(
                  idNaiveBayes: naiveBayesModel.idNaiveBayes,
                  data: {
                    'terisi': false,
                  },
                );
                methodApp.updateKamarById(
                  noKamar: naiveBayesModel.idKamar!.id,
                  data: {
                    'penghuni': FieldValue.delete(),
                  },
                );
              },
            ),
          ]
        : <Widget>[
            Text(
              'Status Kamar Saat ini masih aktif, dan akan jatuh tempo pada tanggal ${tgl.day} - $month - ${tgl.year}',
            ),
            SizeApp.h100,
          ],
  );
}
