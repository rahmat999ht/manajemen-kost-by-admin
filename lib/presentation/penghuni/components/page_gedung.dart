import '../../../domain/core/core.dart';

class PageGedung extends StatelessWidget {
  const PageGedung({
    super.key,
    required this.gedung,
    required this.valueTerisi,
    required this.valueKosong,
  });
  final List<KamarModel> gedung;
  final int valueTerisi;
  final int valueKosong;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Column(
            children: [
              SizeApp.h100,
              Card(
                margin: const EdgeInsets.all(0),
                color: ColorApp.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  side: BorderSide.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      SizeApp.h50,
                      const KetWarna(),
                      SizeApp.h20,
                      ListLantai(
                        data: gedung,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          StatusKamar(
            kosong: valueKosong.toString(),
            terisi: valueTerisi.toString(),
          ),
        ],
      ),
    );

    // final methodApp = MethodApp();
    // return StreamBuilder<DocumentSnapshot<NoKamarModel>>(
    //   stream: methodApp.noKamar(gedung).snapshots(),
    //   builder: (context, s) {
    //     if (s.hasData) {
    //       final data = s.data!.data()!;
    //       return StreamKamar(data: data);
    //     }
    //     return const Center(
    //       child: StreamKamar.nullValue(),
    //     );
    //   },
    // );
  }
}
