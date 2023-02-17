import '../../../../../domain/core/core.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
    required this.foto,
    required this.nama,
    required this.status,
  });

  final ImageHash? foto;
  final String? nama;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarWidget(
          imageHash: foto,
        ),
        SizeApp.h20,
        Text(
          nama!,
          style: const TextStyle(
            color: ColorApp.blackText,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizeApp.h20,
        Text(
          status!,
          style: const TextStyle(
            color: ColorApp.gray,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
