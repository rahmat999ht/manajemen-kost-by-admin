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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: const [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Card(
                                  color: ColorApp.orange,
                                ),
                              ),
                              Text(
                                "Terisi",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.blueText,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Card(
                                  color: ColorApp.red,
                                ),
                              ),
                              Text(
                                "Kosong",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.blueText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizeApp.h20,
                      SingleChildScrollView(
                        child: isStream
                            ? Column(
                                children: [
                                  ItemLantai(
                                    "Lantai 1",
                                    data: data!.lantai1!,
                                  ),
                                  SizeApp.h18,
                                  ItemLantai(
                                    "Lantai 2",
                                    data: data!.lantai2!,
                                  ),
                                  SizeApp.h18,
                                  ItemLantai(
                                    "Lantai 3",
                                    data: data!.lantai3!,
                                  ),
                                  SizeApp.h18,
                                  ItemLantai(
                                    "Lantai 4",
                                    data: data!.lantai4!,
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: SizeApp.hFull - 290,
                                width: SizeApp.wFull,
                                child: const LaodingState(),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 180,
            // width: 300,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              color: ColorApp.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Kamar Terisi",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorApp.blueText,
                          ),
                        ),
                        isStream
                            ? const Text(
                                "18",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.orange,
                                ),
                              )
                            : const SizedBox(
                                height: 10,
                                width: 10,
                                child: LaodingState(),
                              ),
                      ],
                    ),
                    SizeApp.h20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Kamar Kosong",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorApp.blueText,
                          ),
                        ),
                        isStream
                            ? const Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.red,
                                ),
                              )
                            : const SizedBox(
                                height: 10,
                                width: 10,
                                child: LaodingState(),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
