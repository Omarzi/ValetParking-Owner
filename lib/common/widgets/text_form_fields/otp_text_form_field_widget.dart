import 'package:valetparking_owner/utils/constants/exports.dart';

class OTPTextFormFieldWidget extends StatelessWidget {
  const OTPTextFormFieldWidget({super.key, required this.focusNode, required this.isFieldFocused, required this.controller});

  final FocusNode focusNode;
  final bool isFieldFocused;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82.w,
      height: 61.h,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if(value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: VStyles.h4Bold(context).copyWith(height: 1.2.h),
        textAlign: TextAlign.center,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: isFieldFocused ? VColors.purpleTransparent.withOpacity(.08) : VColors.greyScale50,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: isFieldFocused ? BorderSide(color: VColors.primaryColor500) : BorderSide(color: VColors.greyScale200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: VColors.primaryColor500),
          ),
        ),
      ),
    );
  }
}
