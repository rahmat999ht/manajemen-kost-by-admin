import '../../core/core.dart';

class ButtonPrymary extends StatelessWidget {
  const ButtonPrymary({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.isLoading = false,
    this.bgColor,
  }) : isBlack = false;

  const ButtonPrymary.isBlack({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.isLoading = false,
  })  : isBlack = true,
        bgColor = null;

  final void Function() onPressed;
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final bool isBlack;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isBlack ? ColorApp.blackNavi : bgColor ?? ColorApp.orange,
        fixedSize: Size(SizeApp.wFull, isBlack ? 40 : 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: isLoading == true ? null : onPressed,
      child: isLoading == true
          ? const SizedBox(
              height: 30,
              width: 30,
              child: LoadingState(),
            )
          : Text(
              // "Get Started",
              text,
              style: TextStyle(
                fontSize: isBlack ? 16 : 24,
                color: textColor ?? ColorApp.white,
              ),
            ),
    );
  }
}
