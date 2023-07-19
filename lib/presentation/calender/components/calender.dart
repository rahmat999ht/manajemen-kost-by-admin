import '../../../domain/core/core.dart';

class Calendar extends GetView<CalenderController> {
  const Calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar<NaiveBayesModel>(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        firstDay: controller.kFirstDay,
        lastDay: controller.kLastDay,
        focusedDay: controller.focusedDay.value,
        selectedDayPredicate: (day) =>
            isSameDay(controller.selectedDay.value, day),
        rangeStartDay: controller.rangeStart,
        rangeEndDay: controller.rangeEnd,
        calendarFormat: controller.calendarFormat,
        rangeSelectionMode: controller.rangeSelectionMode,
        eventLoader: controller.getEventsForDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: CalendarStyle(
          // Use `CalendarStyle` to customize the UI
          markerMargin: const EdgeInsets.symmetric(
            horizontal: 1,
            vertical: 5,
          ),
          cellMargin: const EdgeInsets.all(13),
          markerSize: 5,
          markersMaxCount: 3,
          markerDecoration: const BoxDecoration(
            color: ColorApp.red,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            border: Border.all(color: ColorApp.red, width: 2),
            color: ColorApp.orange,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
          ),
          selectedDecoration: BoxDecoration(
            color: ColorApp.orange,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
          ),
          weekendDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
          ),
          defaultDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
          ),
          outsideDaysVisible: false,
        ),
        onDaySelected: controller.onDaySelected,
        onRangeSelected: controller.onRangeSelected,
        onFormatChanged: (format) {
          if (controller.calendarFormat != format) {
            controller.calendarFormat = format;
          }
        },
        onPageChanged: (focusedDay) {
          controller.focusedDay.value = focusedDay;
        },
      ),
    );
  }
}
