import '../../../../../domain/core/core.dart';

class CardKamarKosong extends StatelessWidget {
  const CardKamarKosong({super.key, required this.data});

  final KamarModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // right: 12,
        left: 12,
        bottom: 20,
        top: 12,
      ),
      child: Container(
        height: 180.0,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(10.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: ListTile(
          title: Text(data.id!),
          subtitle: Text('${data.lantai} ${data.gedung}'),
        ),
      ),
    );
  }
}
