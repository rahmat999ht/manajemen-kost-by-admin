import '../../../../../domain/core/core.dart';

class ValueKamarKosong extends StatelessWidget {
  const ValueKamarKosong({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final List<KamarModel?>? value;

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
              color: ColorApp.black,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 130.0,
          child: value!.isEmpty
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
                  itemCount: value?.length,
                  itemBuilder: (context, index) {
                    return CardKamarKosong(
                      data: value![index]!,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
