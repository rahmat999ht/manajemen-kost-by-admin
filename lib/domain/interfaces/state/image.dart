import 'dart:io';

import '../../core/core.dart';

mixin ImageState {
  TextButton imageEmpty(dynamic getImg) {
    return TextButton(
      onPressed: () async => await getImg(),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.photo_camera,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Tambahkan Nota',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget imageUpdateProfilEmpty(ImageHash? imageHash, dynamic getImage) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: AvatarWidget(
            imageHash: imageHash,
            height: 180,
            width: 180,
            radius: 100,
          ),
        ),
        InkWell(
          onTap: () async => await getImage(),
          //go to camera
          child: CardIcon(
            icon: Assets.camera,
            radius: 30,
            height: 54,
            width: 54,
            color: ColorApp.green,
          ),
        ),
      ],
    );
  }

  Widget imageUpdateProfilSucces(List<XFile> state, dynamic getImage) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.file(
            File(state.first.path),
            fit: BoxFit.cover,
            height: 180,
            width: 180,
          ),
        ),
        InkWell(
          onTap: () async => await getImage(),
          //go to camera
          child: CardIcon(
            icon: Assets.camera,
            radius: 30,
            height: 54,
            width: 54,
            color: ColorApp.green,
          ),
        ),
      ],
    );
  }

  Widget imageSuccess(List<XFile> state, void Function(int) removeImage) {
    return Container(
      height: 108,
      width: double.infinity,
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        reverse: false,
        scrollDirection: Axis.horizontal,
        itemCount: state.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(state[index].path),
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  removeImage(index);
                },
                child: const ClipOval(
                  child: Card(
                    margin: EdgeInsets.all(0),
                    color: ColorApp.white,
                    child: Icon(
                      Icons.cancel,
                      color: ColorApp.orange,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 12,
          );
        },
      ),
    );
  }
}
