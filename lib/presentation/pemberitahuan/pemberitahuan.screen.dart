import 'package:manajemen_kost_by_admin/presentation/pemberitahuan/components/details_pemberitahuan.dart';

import '../../domain/core/core.dart';
import 'controllers/pemberitahuan.controller.dart';

class PemberitahuanScreen extends GetView<PemberitahuanController> {
  const PemberitahuanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBack('Pemberitahuan'),
      body: controller.obx(
        (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              final data = state[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      final MethodApp methodApp = MethodApp();
                      Get.to(
                        DetailPemberitahuan(pemberitahuanModel: data),
                      );
                      methodApp.updatePemberitahuanById(
                        id: data.id,
                        data: {'isView': true},
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'kamar ${data.idKamar!.id}',
                      ),
                      subtitle: Text(
                        data.deskripsi!,
                        style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: Text(
                        controller.getDateTime(data.dateUpload!),
                        style: TextStyle(
                          color: data.isView == true
                              ? ColorApp.blackText
                              : ColorApp.red,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }),
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const SizedBox(height: 130, child: LoadingState()),
        onError: (e) {
          return Center(child: Text("pesan error : $e"));
        },
      ),
    );
  }
}
