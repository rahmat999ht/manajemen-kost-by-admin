import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class IconFAB extends StatelessWidget {
  const IconFAB({
    Key? key,
    required this.alignment,
    required this.size,
    required this.toogle,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final Alignment alignment;
  final double size;
  final bool toogle;
  final String title;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: alignment,
      curve: toogle ? Curves.easeIn : Curves.elasticOut,
      duration: toogle
          ? const Duration(milliseconds: 275)
          : const Duration(milliseconds: 875),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              padding: const EdgeInsets.all(10),
              duration: const Duration(milliseconds: 275),
              curve: toogle ? Curves.easeIn : Curves.easeOut,
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: toogle ? 8 : 12,
                color: ColorApp.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
