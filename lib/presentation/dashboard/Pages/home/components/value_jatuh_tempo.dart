import '../../../../../domain/core/core.dart';

class ValueJatuhTempo extends StatelessWidget {
  const ValueJatuhTempo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final List<NaiveBayesModel?>? value;

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
                  color: ColorApp.black,
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
          child: value!.isEmpty
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
                  itemCount: value?.length,
                  itemBuilder: (context, index) {
                    return CardNaiveBayes(
                      naiveBayesModel: value![index],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
