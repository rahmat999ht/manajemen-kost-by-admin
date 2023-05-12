import '../../core/core.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final String? titel;
  final String? hintText;
  final String? info;
  final Color? color;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isPhone;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isCheck;
  final bool isTitle;
  final bool isBorder;
  final bool isBg;
  final int? maxLength;
  final double? radius;
  const TextForm({
    super.key,
    required this.controller,
    this.titel,
    this.hintText,
    this.width,
    this.icon,
    this.info,
    this.color,
    this.validator,
    this.textInputType,
    this.inputFormatters,
    this.onTap,
    this.isCheck = false,
    this.isTitle = false,
    this.isBorder = false,
    this.isBg = false,
    this.maxLength,
    this.radius,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  }) : isPhone = false;

  const TextForm.phone({
    super.key,
    required this.controller,
    this.titel,
    this.hintText,
    this.width,
    this.icon,
    this.info,
    this.color,
    this.validator,
    this.textInputType,
    this.inputFormatters,
    this.onTap,
    this.isTitle = false,
    this.isCheck = false,
    this.isBorder = false,
    this.isBg = false,
    this.maxLength,
    this.radius,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  }) : isPhone = true;

  const TextForm.border({
    super.key,
    required this.controller,
    required this.titel,
    this.hintText,
    this.width,
    this.icon,
    this.info,
    this.color,
    this.validator,
    this.textInputType,
    this.inputFormatters,
    this.onTap,
    this.isCheck = false,
    this.isTitle = false,
    this.isPhone = false,
    this.maxLength,
    this.radius,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  })  : isBorder = true,
        isBg = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isTitle)
            Text(
              titel!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorApp.gray,
              ),
            ),
          if (isTitle) SizeApp.h10,
          TextFormField(
            onChanged: onChanged,
            maxLength: maxLength,
            maxLines: null,
            minLines: 1,
            controller: controller,
            validator: isCheck == true
                ? (value) {
                    if (nullValidation(value)) {
                      return "Harap di isi";
                    }
                    return null;
                  }
                : validator,
            readOnly: onTap != null,
            onTap: onTap,
            keyboardType: isPhone ? TextInputType.phone : textInputType,
            inputFormatters: isPhone
                ? [
                    MaskTextInputFormatter(
                      mask: '+62############',
                      filter: {"#": RegExp(r'[0-9]')},
                      initialText: "##",
                      type: MaskAutoCompletionType.eager,
                    ),
                  ]
                : inputFormatters,
            decoration: InputDecoration(
              fillColor: isBg ? color : Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(color: color ?? ColorApp.grayForm)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? 8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(color: color ?? ColorApp.gray)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? 8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(color: color ?? ColorApp.red)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? 8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? BorderSide(color: color ?? ColorApp.red)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? 8),
              ),
              filled: true,
              labelText: isTitle ? null : titel,
              hintText: hintText,
              alignLabelWithHint: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              isDense: true,
              suffixIcon: suffixIcon,
              icon: icon,
              prefixIcon: prefixIcon,
            ),
          ),
          Visibility(
            visible: info != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 16),
              child: Text(
                info ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorApp.gray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
