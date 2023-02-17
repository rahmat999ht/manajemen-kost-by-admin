import '../../core/core.dart';

class ButtonPrymary extends StatelessWidget {
  const ButtonPrymary({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
  }) : isBlack = false;

  const ButtonPrymary.isBlack({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
  }) : isBlack = true;

  final void Function() onPressed;
  final String text;
  final Color? textColor;
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isBlack ? ColorApp.blackNavi : ColorApp.orange,
        fixedSize: Size(SizeApp.wFull, isBlack ? 40 : 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
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
