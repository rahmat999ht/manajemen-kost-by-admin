import '../../../../domain/core/core.dart';

class ListPenghuniScreen extends GetView<ListPenghuniController> {
  const ListPenghuniScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        elevation: 0,
        toolbarHeight: 65,
        flexibleSpace: const FormSearch(),
      ),
      body: controller.obx(
        (state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state!.length,
            itemBuilder: (
              context,
              index,
            ) {
              return Penghuni(
                // imageHash: items[index].avatarImage!,
                name: state[index].nama,
                status: state[index].status,
                position: state[index].status,
                onTap: () {},
              );
            },
          );
        },
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const LoadingState(),
      ),
    );
  }
}
