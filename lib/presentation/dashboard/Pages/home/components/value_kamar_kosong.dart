import '../../../../../domain/core/core.dart';

class ValueKamarKosong extends GetView<KamarController> {
  const ValueKamarKosong({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeApp.h20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorApp.blackText,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 130.0,
            child: state!.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada kamar kosong',
                      style: TextStyle(
                        color: ColorApp.gray,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return CardKamarKosong(
                        listData: state,
                        index: index,
                      );
                    },
                  ),
          ),
        ],
      );
    });
  }
}
