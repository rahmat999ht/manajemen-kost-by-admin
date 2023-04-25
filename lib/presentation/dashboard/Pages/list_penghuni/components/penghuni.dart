import '../../../../../domain/core/core.dart';

class Penghuni extends StatelessWidget {
  final PenghuniModel? penghuni;
  final bool data;
  final void Function()? onTap;
  const Penghuni({
    Key? key,
    required this.penghuni,
    required this.onTap,
  })  : data = true,
        super(key: key);
  const Penghuni.nullValue({
    Key? key,
  })  : data = false,
        penghuni = null,
        onTap = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data ? onTap : null,
      child: ListTile(
        leading: penghuni!.image != null
            ? AvatarWidget(
                imageHash: penghuni!.image!,
                height: 37,
                width: 37,
              )
            : const CircleAvatar(
                child: Icon(
                  Icons.person_pin,
                  size: 37,
                  color: Colors.white60,
                ),
              ),
        title: Text(
          data ? penghuni!.nama : ' - ',
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Geomanist',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          data ? penghuni!.status : ' - ',
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Geomanist',
          ),
        ),
        trailing: Text(
          data ? penghuni?.peran ?? 'kosong' : ' - ',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Geomanist',
          ),
        ),
      ),
    );
  }
}
