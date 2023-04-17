import '../../../domain/core/core.dart';

class FabEmpty extends StatelessWidget {
  const FabEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.orange,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 50.0,
      width: 50.0,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: Colors.black54,
          child: SvgPicture.asset(
            Assets.elementplus,
            // size: 60,
          ),
        ),
      ),
    );
  }
}
