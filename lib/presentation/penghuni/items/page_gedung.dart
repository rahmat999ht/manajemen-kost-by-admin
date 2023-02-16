import '../../../domain/core/core.dart';

class PageGedung extends StatelessWidget {
  const PageGedung({
    super.key,
    required this.gedung,
  });
  final String gedung;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<NoKamarModel>>(
      stream: UtilsApp.noKamar(gedung).snapshots(),
      builder: (context, s) {
        if (s.hasData) {
          final data = s.data!.data()!;
          return StreamKamar(data: data);
        }
        return const Center(
          child: StreamKamar.nullValue(),
        );
      },
    );
  }
}
