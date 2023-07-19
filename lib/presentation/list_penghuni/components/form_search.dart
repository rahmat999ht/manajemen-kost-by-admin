import '../../../domain/core/core.dart';

class FormSearch extends GetView<ListPenghuniController> {
  const FormSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeApp.h40,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => TextForm(
              isBg: true,
              radius: 40,
              hintText: "Search",
              controller: controller.cSearch,
              color: ColorApp.grayForm,
              onChanged: (v) {
                controller.onChange(v);
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
      ],
    );
  }
}
