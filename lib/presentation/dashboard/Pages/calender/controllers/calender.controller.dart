import 'dart:collection';

import '../../../../../domain/core/core.dart';

class CalenderController extends GetxController
    with StateMixin<Iterable<Map<DateTime, List<NaiveBayesModel>>>> {
  ValueNotifier<List<NaiveBayesModel>>? selectedEvents;
  final tglSkrg = Timestamp.now().toDate();
  final methodApp = MethodApp();
  List monthsFormat = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ].obs;

  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = DateTime.now().obs;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  final kEvents = LinkedHashMap<DateTime, List<NaiveBayesModel>>(
    equals: isSameDay,
    hashCode: (DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    },
  );

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);

  List<NaiveBayesModel> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<NaiveBayesModel> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    if (!isSameDay(selectedDay.value, selectDay)) {
      selectedDay.value = selectDay;
      focusedDay.value = focusDay;
      rangeStart = null; // Important to clean those
      rangeEnd = null;
      rangeSelectionMode = RangeSelectionMode.toggledOff;

      selectedEvents?.value = getEventsForDay(selectDay);
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    selectedDay.value = null;
    focusedDay.value = focusDay;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;

    // `start` or `end` could be null
    if (start != null && end != null) {
      selectedEvents?.value = getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents?.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents?.value = getEventsForDay(end);
    }
  }

  @override
  void onInit() {
    selectedDay.value = focusedDay.value;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay.value!));

    super.onInit();
  }

  @override
  void dispose() {
    selectedEvents?.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    selectedEvents?.dispose();
  }
}
