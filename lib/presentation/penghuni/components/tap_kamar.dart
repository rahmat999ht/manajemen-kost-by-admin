import '../../../domain/core/core.dart';

class CardTapKamar extends StatelessWidget {
  const CardTapKamar({
    super.key,
    required this.onTap,
    required this.noKamar,
    required this.isLoading,
  });

  final String noKamar;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading == true ? null : onTap,
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
          child: isLoading == true
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: LoadingState(),
                )
              : Text(
                  noKamar,
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
