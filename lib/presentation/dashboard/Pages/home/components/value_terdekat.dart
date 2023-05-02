import 'package:manajemen_kost_by_admin/presentation/dashboard/Pages/home/controllers/terdekat.controller.dart';

import '../../../../../domain/core/core.dart';

class ValueTerdekat extends GetView<TerdekatController> {
  const ValueTerdekat({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Column(
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
          SizedBox(
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
        ],
      ),
      onEmpty: const Center(child: Text("Masih Kosong")),
      onLoading: const LoadingState(),
      onError: (e) {
        return Center(child: Text("pesan error : $e"));
      },
    );
  }
}
