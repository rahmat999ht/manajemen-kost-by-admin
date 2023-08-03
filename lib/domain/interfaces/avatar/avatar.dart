import '../../core/core.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.imageHash,
    this.width = 80,
    this.height = 80,
    this.radius = 70,
    this.heightPlus = 10,
    this.isRadiusAll = true,
    this.radiusTL = 0,
    this.radiusTR = 0,
    this.radiusBL = 0,
    this.radiusBR = 0,
  });
  final ImageHash? imageHash;
  final double? height;
  final double? heightPlus;
  final double? width;
  final bool? isRadiusAll;
  final double? radius;
  final double? radiusTL;
  final double? radiusTR;
  final double? radiusBL;
  final double? radiusBR;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: isRadiusAll!
            ? BorderRadius.circular(radius!)
            : BorderRadius.only(
                topLeft: Radius.circular(radiusTL!),
                topRight: Radius.circular(radiusTR!),
                bottomLeft: Radius.circular(radiusBL!),
                bottomRight: Radius.circular(radiusBR!),
              ),
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
