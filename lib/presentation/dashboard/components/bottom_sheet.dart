import '../../../domain/core/core.dart';

Future buttonSheet({
  BuildContext? context,
  String? title,
  List<Widget>? content,
}) async {
  return await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0),
      ),
    ),
    backgroundColor: ColorApp.white,
    context: context!,
    builder: (context) {
      return ClipRRect(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 0,
            color: ColorApp.white,
            child: Wrap(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Align(
                        heightFactor: 0.6,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: ColorApp.gray,
                        ),
                      ),
                    ),
                    SizeApp.h10,
                    Text(
                      title!,
                      // 'Hubungi lewat',
                      style: const TextStyle(
                        color: ColorApp.blackText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizeApp.h10,
                    const Divider(
                      thickness: 2,
                    ),
                    SizeApp.h10,
                    ...content!,
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
