import '../../core/core.dart';

class ButtonPrymary extends StatelessWidget {
  const ButtonPrymary({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.width,
    this.bgColor,
    this.txSize,
  });

  final void Function() onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? bgColor;
  final double? txSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? ColorApp.orange,
        fixedSize: Size(width ?? SizeApp.wFull, height ?? 50),
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
          fontSize: txSize ?? 24,
        ),
      ),
    );
  }
}
