import '../../../domain/core/core.dart';

class ValueKamarKosong extends StatelessWidget {
  const ValueKamarKosong({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final KamarController controller;

  @override
  Widget build(BuildContext context) {
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
        controller.obx(
          (state) => SizedBox(
            height: 130.0,
            width: Get.width,
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
          onEmpty: const Center(child: Text("Masih Kosong")),
          onLoading: const SizedBox(height: 130, child: LoadingState()),
          onError: (e) {
            return Center(child: Text("pesan error : $e"));
          },
        )
      ],
    );
  }
}
