import '../../../domain/core/core.dart';

class HeaderHome extends GetView<HomeController> {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selamat Datang',
          style: TextStyle(
            color: ColorApp.gray,
            fontSize: 14,
          ),
        ),
        StreamBuilder<DocumentSnapshot<AdminModel>>(
          stream: controller.methodApp.admin(ConstansApp.idLogin).snapshots(),
          builder: (ctx, s) {
            final data = s.data?.data()!;
            if (s.hasData) {
              return Row(
                children: [
                  AvatarWidget(
                    imageHash: data!.foto,
                    heightPlus: 3,
                    height: 24,
                    width: 24,
                  ),
                  SizeApp.w6,
                  Text(
                    data.nama!,
                    style: const TextStyle(
                      color: ColorApp.blackText,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text("Proses ..."));
          },
        ),
      ],
    );
  }
}
