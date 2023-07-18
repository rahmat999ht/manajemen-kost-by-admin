import '../../../domain/core/core.dart';

class KetWarna extends StatelessWidget {
  const KetWarna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
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
          children: [
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
    );
  }
}
