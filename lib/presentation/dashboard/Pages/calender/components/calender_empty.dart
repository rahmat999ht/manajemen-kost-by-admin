import '../../../../../domain/core/core.dart';

class CalenderEmpty extends StatelessWidget {
  const CalenderEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            Assets.imgEmpty,
          ),
        ),
        const Text(
          'Opsss, Calender kosong',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
