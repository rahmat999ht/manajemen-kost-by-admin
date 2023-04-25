import '../../../domain/core/core.dart';

class ListLantai extends StatelessWidget {
  const ListLantai({
    super.key,
    required this.isStream,
    required this.data,
  });

  final bool isStream;
  final NoKamarModel? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
