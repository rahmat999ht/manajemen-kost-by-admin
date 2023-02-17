import '../../core/core.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({
    super.key,
    required this.icon,
    this.radius,
    this.height,
    this.width,
    this.color,
  });

  final String icon;
  final double? radius;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 10),
        ),
      ),
      color: color ?? ColorApp.grayForm,
      child: SizedBox(
        height: height ?? 40,
        width: width ?? 40,
        child: Center(
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
