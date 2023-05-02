import '../../../../../domain/core/core.dart';

class ValueDate extends GetView<CalenderController> {
  const ValueDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 16.0),
          Text(
            controller.focusedDay.value.day.toString(),
            textAlign: TextAlign.start,
            style: const TextStyle(color: ColorApp.blackText, fontSize: 18),
          ),
          const SizedBox(width: 5.0),
          Text(
            controller.monthsFormat[controller.focusedDay.value.month - 1]
                .toString(),
            textAlign: TextAlign.start,
            style: const TextStyle(color: ColorApp.blackText, fontSize: 18),
          ),
          const SizedBox(width: 5.0),
          Text(
            controller.focusedDay.value.year.toString(),
            textAlign: TextAlign.start,
            style: const TextStyle(color: ColorApp.blackText, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
