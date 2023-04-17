import '../../core/core.dart';

class ButtonText extends StatelessWidget {
  const ButtonText(
    this.title, {
    super.key,
    required this.onTap,
    this.titleColor,
    this.fontSize,
  })  : isIcon = false,
        rigtIcon = false,
        icon = null,
        iconColor = null;

  const ButtonText.isIcon(
    this.title, {
    super.key,
    required this.onTap,
    required this.icon,
    this.rigtIcon = false,
    this.iconColor,
    this.titleColor,
    this.fontSize,
  }) : isIcon = true;

  final String title;
  final void Function()? onTap;
  final IconData? icon;
  final Color? iconColor;
  final Color? titleColor;
  final bool isIcon;
  final bool? rigtIcon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isIcon == true && rigtIcon == false)
          Icon(
            icon,
            color: iconColor ?? ColorApp.orange,
          ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: titleColor ?? ColorApp.orange,
              fontSize: fontSize ?? 12,
            ),
          ),
        ),
        if (isIcon == true && rigtIcon == true)
          Icon(
            icon,
            color: iconColor ?? ColorApp.orange,
          ),
      ],
    );
  }
}
