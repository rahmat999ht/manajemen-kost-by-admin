import '../../core/core.dart';

class ButtonText extends StatelessWidget {
  const ButtonText(
    this.title, {
    super.key,
    required this.onTap,
    this.titleColor,
  })  : isIcon = false,
        icon = null,
        iconColor = null;

  const ButtonText.isIcon(
    this.title, {
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.titleColor,
  }) : isIcon = true;

  final String title;
  final void Function()? onTap;
  final IconData? icon;
  final Color? iconColor;
  final Color? titleColor;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isIcon == true)
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
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
