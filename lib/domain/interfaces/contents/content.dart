import '../../core/core.dart';

class Content extends StatelessWidget {
  const Content(
    this.title,
    this.subTitle, {
    super.key,
    this.colorTitle,
    this.colorSubTitle,
    this.sizeTitle,
    this.sizeSubTitle,
    this.styleTitle,
    this.styleSubTitle,
    this.fontWeightTitle,
    this.fontWeightSubTitle,
    this.space,
  });

  final String title;
  final String subTitle;
  final Color? colorTitle;
  final Color? colorSubTitle;
  final double? sizeTitle;
  final double? sizeSubTitle;
  final FontStyle? styleTitle;
  final FontStyle? styleSubTitle;
  final FontWeight? fontWeightTitle;
  final FontWeight? fontWeightSubTitle;
  final double? space;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: sizeTitle ?? 14,
            fontWeight: fontWeightTitle,
            fontStyle: styleTitle,
            color: colorTitle ?? ColorApp.brown,
          ),
        ),
        SizedBox(
          height: space ?? 0.0,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: sizeSubTitle ?? 14,
            fontWeight: fontWeightSubTitle,
            fontStyle: styleSubTitle,
            color: colorSubTitle ?? ColorApp.brown,
          ),
        ),
      ],
    );
  }
}
