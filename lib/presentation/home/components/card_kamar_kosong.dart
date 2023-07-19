import '../../../domain/core/core.dart';

class CardKamarKosong extends StatelessWidget {
  const CardKamarKosong({
    super.key,
    required this.listData,
    required this.index,
  });

  final List<KamarModel?> listData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final KamarModel data = listData[index]!;
    return Container(
      margin: EdgeInsets.only(
        left: 12,
        bottom: 20,
        top: 12,
        right: listData.length == index + 1 ? 30 : 0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 67.0,
      width: Get.width * 0.44,
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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No. ${data.id!}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorApp.blackText,
              ),
            ),
            SizeApp.h10,
            SizeApp.wFull,
            Text(
              '${data.lantai}, ${data.gedung}',
              style: const TextStyle(
                fontSize: 13,
                color: ColorApp.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
