import '../../../../../domain/core/core.dart';

class Penghuni extends StatelessWidget {
  // final ImageHash? imageHash;
  final String name;
  final String status;
  final String position;
  final bool data;
  final void Function()? onTap;
  const Penghuni({
    Key? key,
    // required this.imageHash,
    required this.name,
    required this.status,
    required this.position,
    required this.onTap,
  })  : data = true,
        super(key: key);
  const Penghuni.nullValue({
    Key? key,
  })  : data = false,
        // imageHash = null,
        onTap = null,
        name = ' - ',
        status = ' - ',
        position = ' - ',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data ? onTap : null,
      child: ListTile(
        // leading: imageHash != null
        //     ? AvatarWidget(
        //         imageHash: imageHash!,
        //         size: 37,
        //       )
        //     : const CircleAvatar(
        //         child: Icon(
        //           CupertinoIcons.person_circle,
        //           size: 37,
        //           color: Colors.white60,
        //         ),
        //       ),
        leading: const CircleAvatar(
          child: Icon(
            Icons.person_pin,
            size: 37,
            color: Colors.white60,
          ),
        ),
        title: Text(
          data ? name : ' - ',
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Geomanist',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          data ? status : ' - ',
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Geomanist',
          ),
        ),
        trailing: Text(
          data ? position : ' - ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Geomanist',
          ),
        ),
      ),
    );
  }
}
