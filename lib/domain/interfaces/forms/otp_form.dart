import '../../core/core.dart';

class OtpForm extends StatelessWidget {
  final TextEditingController controller;

  const OtpForm({
    Key? key,
    required this.controller,
    required this.firstField,
    required this.secondField,
  }) : super(key: key);

  final FocusNode firstField;
  final FocusNode secondField;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: secondField,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      onChanged: (v) {
        if (v.length == 1) {
          FocusScope.of(context).nextFocus();
        } else if (v.isEmpty) {
          FocusScope.of(context).requestFocus(firstField);
        }
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: ColorApp.orange,
          ),
        ),
      ),
    );
  }
}
