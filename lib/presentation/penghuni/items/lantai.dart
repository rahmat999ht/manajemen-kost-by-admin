import '../../../domain/core/core.dart';

class ItemLantai extends GetView<PenghuniController> {
  const ItemLantai(
    this.title, {
    super.key,
    required this.data,
  });

  final String title;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "    $title",
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.blueText,
          ),
        ),
        SizeApp.h8,
        GridView.builder(
          padding: const EdgeInsets.all(0),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 85,
            childAspectRatio: 1,
            crossAxisSpacing: 22,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return CardTapKamar(
              onTap: () {},
              data: data[index],
            );
          },
        ),
      ],
    );
  }
}
