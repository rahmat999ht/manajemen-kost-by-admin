import '../../domain/core/core.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Edit profil',
        false,
      ),
      body: const Center(
        child: Text(
          'ProfileUpdateScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
