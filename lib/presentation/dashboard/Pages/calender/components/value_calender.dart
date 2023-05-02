import '../../../../../domain/core/core.dart';

class ValueCalender extends GetView<CalenderController> {
  const ValueCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<NaiveBayesModel>>(
        valueListenable: controller.selectedEvents ??
            [] as ValueNotifier<List<NaiveBayesModel>>,
        builder: (context, value, _) {
          if (value.isNotEmpty) {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                var datacCalender = value[index];
                return CardCalender(
                  data: datacCalender,
                  onTap: () {},
                );
              },
            );
          }
          return const CalenderEmpty();
        },
      ),
    );
  }
}
