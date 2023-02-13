import 'package:manajemen_kost_by_admin/domain/interfaces/forms/form.dart';

import '../../domain/core/core.dart';

class PenghuniScreen extends GetView<PenghuniController> {
  const PenghuniScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamar'),
        // automaticallyImplyLeading: false,
        actions: [
          TextForm.border(
            controller: controller.cGedung,
            width: 100,
            titel: 'Gedung ??',
            color: Colors.transparent,
          ),
        ],
      ),
      body: const PageGedung(
        gedung: 'Gedung B',
      ),
    );
  }
}

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
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class StreamKamar extends StatelessWidget {
  const StreamKamar({
    super.key,
    required this.data,
  }) : isStream = true;

  const StreamKamar.nullValue({
    super.key,
  })  : isStream = false,
        data = null;
  final NoKamarModel? data;
  final bool isStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ItemLantai(
              "Lantai 1",
              data: data!.lantai1!,
            ),
            SizeApp.h18,
            ItemLantai(
              "Lantai 2",
              data: data!.lantai2!,
            ),
            SizeApp.h18,
            ItemLantai(
              "Lantai 3",
              data: data!.lantai3!,
            ),
            SizeApp.h18,
            ItemLantai(
              "Lantai 4",
              data: data!.lantai4!,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemLantai extends StatelessWidget {
  const ItemLantai(
    this.title, {
    super.key,
    required this.data,
  });

  final String title;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "    $title",
          style: const TextStyle(
            fontSize: 18,
            color: ColorApp.blueText,
          ),
        ),
        SizeApp.h8,
        GridView.builder(
          padding: const EdgeInsets.all(0),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 85,
            childAspectRatio: 1,
            crossAxisSpacing: 22,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              color: ColorApp.orange,
              child: Center(
                child: Text(
                  data[index],
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorApp.blueText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
