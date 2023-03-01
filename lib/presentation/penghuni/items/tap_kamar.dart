import '../../../domain/core/core.dart';

class CardTapKamar extends StatelessWidget {
  const CardTapKamar({
    super.key,
    required this.onTap,
    required this.data,
  });

  final String data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        color: ColorApp.orange,
        child: Center(
          child: Text(
            data,
            style: const TextStyle(
              fontSize: 16,
              color: ColorApp.blueText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
