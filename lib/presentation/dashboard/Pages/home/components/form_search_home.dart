import '../../../../../domain/core/core.dart';

class FormSearchHome extends GetView<HomeController> {
  const FormSearchHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => TextForm(
              isBg: true,
              radius: 40,
              hintText: "Search no.kamar",
              controller: controller.cSearch,
              color: ColorApp.grayForm,
              onChanged: (v) {
                controller.cJatuhTempo.onChange(v, controller.isSearch);
                controller.cTerdekat.onChange(v, controller.isSearch);
                controller.cKamarKosong.onChange(v, controller.isSearch);
              },
              prefixIcon: const Icon(Icons.search, size: 30),
              suffixIcon: controller.isSearch.isFalse
                  ? const SizedBox()
                  : IconButton(
                      icon: const Icon(
                        Icons.close_sharp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        controller.cSearch.clear();
                        controller.isSearch.value = false;
                      },
                    ),
            ),
          ),
        ),
        SizeApp.h10,
      ],
    );
  }
}