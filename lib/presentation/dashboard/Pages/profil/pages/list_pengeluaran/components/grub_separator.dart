import '../../../../../../../domain/core/core.dart';

class GroupSeparator extends StatelessWidget {
  const GroupSeparator(
    this.value, {
    super.key,
    required this.onTap,
  });
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorApp.blackNavi,
            ),
          ),
          // const Icon(
          //   Icons.arrow_forward_ios,
          //   size: 16,
          // ),
        ],
      ),
    );
  }
}
