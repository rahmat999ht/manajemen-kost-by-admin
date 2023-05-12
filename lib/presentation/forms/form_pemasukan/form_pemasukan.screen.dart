import '../../../domain/core/core.dart';

class FormPemasukanScreen extends GetView<FormPemasukanController> {
  const FormPemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBar(
        'Pemasukan',
        Get.back,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FormPemasukan(),
            ButtonPrymary.isBlack(
              text: 'Simpan',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
