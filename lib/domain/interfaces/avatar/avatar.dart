import 'package:flutter/cupertino.dart';

import '../../core/core.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.imageHash,
    this.size = 80,
  });
  final ImageHash? imageHash;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return imageHash != null
        ? SizedBox(
            height: size,
            width: size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: OctoImage(
                image: CachedNetworkImageProvider(
                  imageHash!.imageUrl,
                  cacheKey: imageHash!.imageUrl,
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  imageHash!.imageHash,
                ),
                errorBuilder: OctoError.icon(color: ColorApp.red),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Icon(
            CupertinoIcons.person_circle,
            size: size! + 20,
            color: ColorApp.orange,
          );
  }
}
