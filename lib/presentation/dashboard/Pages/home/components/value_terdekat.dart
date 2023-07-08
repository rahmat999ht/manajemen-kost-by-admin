import '../../../../../domain/core/core.dart';

class ValueTerdekat extends StatelessWidget {
  const ValueTerdekat({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TerdekatController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeApp.h20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorApp.blackText,
                  fontSize: 18,
                ),
              ),
              const Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorApp.orange,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        controller.obx(
          (state) => SizedBox(
            height: 230.0,
            child: state!.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ada yang $title',
                      style: const TextStyle(
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
                      return CardTerdekat(
                        listTerdekat: state,
                        index: index,
                      );
                    },
                  ),
          ),
          onEmpty: const Center(child: Text("Masih Kosong")),
          onLoading: const SizedBox(height: 230, child: LoadingState()),
          onError: (e) {
            return Center(child: Text("pesan error : $e"));
          },
        ),
      ],
    );
  }
}
