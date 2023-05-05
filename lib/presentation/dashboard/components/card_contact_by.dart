import 'package:manajemen_kost_by_admin/domain/core/core.dart';

class CardContackBy extends StatelessWidget {
  final String icon;
  final String contackBy;
  final void Function()? onTap;
  const CardContackBy({
    Key? key,
    required this.contackBy,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: ColorApp.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: ColorApp.grayForm,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
                    width: 24,
                  ),
                  SizeApp.w6,
                  Text(
                    contackBy,
                    style: const TextStyle(
                      // color: ColorApp.textPrimary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 17,
                color: ColorApp.gray,
              )
            ],
          ),
        ),
      ),
    );
  }
}
