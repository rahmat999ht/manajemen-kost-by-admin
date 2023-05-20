import '../../../../../domain/core/core.dart';

Padding content(
  String title,
  String value, {
  Color? colorValue,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.blackText,
          ),
        ),
        Row(
          children: [
            if (value == 'Air')
              const SizedBox(
                height: 16,
                width: 16,
                child: CircleAvatar(
                  backgroundColor: ColorApp.blue,
                  child: Icon(
                    Icons.water_drop,
                    color: ColorApp.white,
                    size: 12,
                  ),
                ),
              ),
            if (value == 'Listrik')
              const SizedBox(
                height: 16,
                width: 16,
                child: CircleAvatar(
                  backgroundColor: ColorApp.orange,
                  child: Icon(
                    Icons.electric_bolt_sharp,
                    color: ColorApp.white,
                    size: 12,
                  ),
                ),
              ),
            SizeApp.w6,
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorValue ?? ColorApp.blackNavi,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
