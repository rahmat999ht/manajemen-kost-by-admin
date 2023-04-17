import '../../../domain/core/core.dart';

class StreamKamar extends StatelessWidget {
  const StreamKamar({
    super.key,
    required this.data,
  }) : isStream = true;

  const StreamKamar.nullValue({
    super.key,
  })  : isStream = false,
        data = null;
  final NoKamarModel? data;
  final bool isStream;

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
                      SingleChildScrollView(
                        child: isStream
                            ? Column(
                                children: [
                                  ItemLantai(
                                    "Lantai 1",
                                    data: data!.lantai1!,
                                    gedung: data!.id,
                                  ),
                                  SizeApp.h18,
                                  ItemLantai(
                                    "Lantai 2",
                                    data: data!.lantai2!,
                                    gedung: data!.id,
                                  ),
                                  SizeApp.h18,
                                  ItemLantai(
                                    "Lantai 3",
                                    data: data!.lantai3!,
                                    gedung: data!.id,
                                  ),
                                  SizeApp.h18,
                                  ItemLantai(
                                    "Lantai 4",
                                    data: data!.lantai4!,
                                    gedung: data!.id,
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: SizeApp.hFull - 290,
                                width: SizeApp.wFull,
                                child: const LoadingState(),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          StatusKamar(
            isStream: isStream,
            kosong: '2',
            terisi: '18',
          ),
        ],
      ),
    );
  }
}
