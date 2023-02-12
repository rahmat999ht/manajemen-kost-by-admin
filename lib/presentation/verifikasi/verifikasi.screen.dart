import '../../domain/core/core.dart';

class VerifikasiScreen extends GetView<VerifikasiController> {
  const VerifikasiScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: ColorApp.black,
          ),
          iconSize: 24,
          onPressed: Get.back,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      ),
      body: BodyVerifikasi(
        c: controller,
      ),
    );
  }
}

class BodyVerifikasi extends StatelessWidget {
  const BodyVerifikasi({
    super.key,
    required this.c,
  });

  final VerifikasiController c;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizeApp.h100,
            SizeApp.h20,
            Content(
              'Verifikasi',
              c.valueSubTitle,
              space: 20.0,
              sizeTitle: 35,
              sizeSubTitle: 16,
              colorSubTitle: ColorApp.gray,
            ),
            SizeApp.h50,
            Form(
              key: c.formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < c.listOtp.length; i++)
                    SizedBox(
                      height: 50,
                      width: 35,
                      child: OtpForm(
                        controller: c.listOtp[i],
                        firstField: FocusNode(),
                        secondField: FocusNode(),
                      ),
                    ),
                ],
              ),
            ),
            SizeApp.h20,
            ContentKirimUlangKode(
              onTap: c.tapKirimUlang,
            ),
            SizeApp.h36,
            ButtonPrymary(
              onPressed: c.tapVerifikasi,
              text: 'Verifikasi',
            ),
          ],
        ),
      ),
    );
  }
}

class ContentKirimUlangKode extends StatelessWidget {
  const ContentKirimUlangKode({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tidak menerima kode? ",
              style: TextStyle(
                color: ColorApp.gray,
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: const Text(
                "Kirim Ulang",
                style: TextStyle(
                  color: ColorApp.orange,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
