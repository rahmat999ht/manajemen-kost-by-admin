import '../../../domain/core/core.dart';

class StatusKamar extends StatelessWidget {
  const StatusKamar({
    super.key,
    // required this.isStream,
    required this.terisi,
    required this.kosong,
  });

  // final bool isStream;
  final String terisi;
  final String kosong;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              valueKamar(
                "Kamar Terisi",
                terisi,
                ColorApp.orange,
              ),
              SizeApp.h20,
              valueKamar(
                "Kamar Kosong",
                kosong,
                ColorApp.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row valueKamar(
    String title,
    String value,
    Color colors,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.blueText,
          ),
        ),
        // isStream
        //     ?
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: colors,
          ),
        )
        // : const SizedBox(
        //     height: 10,
        //     width: 10,
        //     child: LoadingState(),
        //   ),
      ],
    );
  }
}
