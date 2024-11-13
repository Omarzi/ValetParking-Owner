import 'package:valetparking_owner/utils/constants/exports.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key, required this.controller, required this.focusNode, required this.hintText, this.prefixIcon, required this.fillColor, required this.borderSide, this.suffixIcon, required this.textInputType, this.validator, required this.obscureText, this.obscureCharacter, required this.hintColor, this.textAlign, this.inputFormatters, this.isEdit = false, this.maxLines, this.onChanged, this.readOnly, this.textStyle});

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final Color fillColor;
  final Color hintColor;
  final BorderSide borderSide;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? obscureCharacter;
  final bool isEdit;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool? readOnly;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      focusNode: focusNode,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      validator: validator,
      style: textStyle ?? VStyles.bodyMediumSemiBold(context).copyWith(color: VColors.greyScale900),
      obscureText: obscureText,
      obscuringCharacter: obscureCharacter ?? ' ',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: isEdit ? VStyles.bodyMediumSemiBold(context) : VStyles.bodyMediumRegular(context).copyWith(color: hintColor),
        focusColor: VColors.purpleTransparent,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: borderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: VColors.primaryColor500),
        ),
      ),
    );
  }
}
