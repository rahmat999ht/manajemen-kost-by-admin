import '../../../domain/core/core.dart';

class PageGedung extends StatelessWidget {
  const PageGedung({
    super.key,
    required this.gedung,
  });
  final String gedung;

  @override
  Widget build(BuildContext context) {
    final mhetodApp = MhetodApp();
    return StreamBuilder<DocumentSnapshot<NoKamarModel>>(
      stream: mhetodApp.noKamar(gedung).snapshots(),
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
