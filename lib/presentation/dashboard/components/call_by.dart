import '../../../domain/core/core.dart';

Future callBy(BuildContext context, String? noHp) async {
  MethodApp methodApp = MethodApp();
  return await buttonSheet(
    context: context,
    title: "Hubungi Lewat",
    content: <Widget>[
      CardContackBy(
        contackBy: 'Telegram',
        icon: Assets.imgTele,
        onTap: () async {
          await methodApp.launchTelegram(
            numberTele: noHp!.replaceAll("+62", "62"),
          );
        },
      ),
      SizeApp.h10,
      CardContackBy(
        contackBy: 'WhatsApp',
        icon: Assets.imgWa,
        onTap: () async {
          await methodApp.launchWhatsApp(
            numberWA: noHp!.replaceAll("+62", "62"),
            message: 'Halo',
          );
        },
      ),
    ],
  );
}
