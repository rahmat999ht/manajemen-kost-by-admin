import '../../domain/core/core.dart';

class PenghuniScreen extends GetView<PenghuniController> {
  const PenghuniScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.orange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.orange,
        title: ListTabButtonWidget(
          c: controller,
        ),
        automaticallyImplyLeading: false,
      ),
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: 2,
        onPageChanged: (value) => controller.selectionTab.value = value,
        itemBuilder: (context, index) {
          if (index == 0) {
            return PageGedung(
              gedung: controller.listGedung[0],
            );
          } else {
            return PageGedung(
              gedung: controller.listGedung[1],
            );
          }
        },
      ),
    );
  }
}

class ListTabButtonWidget extends StatelessWidget {
  const ListTabButtonWidget({
    Key? key,
    required this.c,
  }) : super(key: key);

  final PenghuniController c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Card(
        color: ColorApp.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            color: ColorApp.blueText,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: buttonTapBar(
                index: 0,
                activeColor: Colors.blue,
                color: Colors.white,
                title: c.listGedung[0],
              ),
            ),
            Expanded(
              child: buttonTapBar(
                activeColor: Colors.blue,
                color: Colors.white,
                index: 1,
                title: c.listGedung[1],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonTapBar({
    required int index,
    required Color activeColor,
    required Color color,
    required String title,
  }) {
    return GetX<PenghuniController>(
      init: PenghuniController(),
      builder: (controller) {
        return Card(
          elevation: 0,
          color: controller.selectionTab.value == index
              ? ColorApp.white
              : ColorApp.orange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            side: BorderSide.none,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 36,
                width: Get.width,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.changeSelectionTab(index),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          color: controller.selectionTab.value == index
                              ? ColorApp.blueText
                              : ColorApp.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Column(
            children: [
              SizeApp.h100,
              Card(
                margin: const EdgeInsets.all(0),
                color: ColorApp.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  side: BorderSide.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      SizeApp.h50,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: const [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Card(
                                  color: ColorApp.orange,
                                ),
                              ),
                              Text(
                                "Terisi",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.blueText,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Card(
                                  color: ColorApp.red,
                                ),
                              ),
                              Text(
                                "Terisi",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorApp.blueText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizeApp.h20,
                      SingleChildScrollView(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 180,
            // width: 300,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              color: ColorApp.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          "Kamar Terisi",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorApp.blueText,
                          ),
                        ),
                        Text(
                          "18",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorApp.orange,
                          ),
                        ),
                      ],
                    ),
                    SizeApp.h20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          "Kamar Kosong",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorApp.blueText,
                          ),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorApp.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            fontSize: 14,
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
                    fontSize: 16,
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
