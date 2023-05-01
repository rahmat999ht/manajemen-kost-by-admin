import '../../core/core.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.imageHash,
    this.width = 80,
    this.height = 80,
    this.radius = 70,
    this.heightPlus = 10,
  });
  final ImageHash? imageHash;
  final double? height;
  final double? heightPlus;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: imageHash != null
            ? OctoImage(
                image: CachedNetworkImageProvider(
                  imageHash!.imageUrl,
                  cacheKey: imageHash!.imageUrl,
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  imageHash!.imageHash,
                ),
                errorBuilder: OctoError.icon(color: ColorApp.red),
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.person_pin,
                size: height! + heightPlus!,
                color: ColorApp.orange,
              ),
      ),
    );
  }
}
