import 'package:valetparking_owner/utils/constants/exports.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key, required this.isChecked, this.onChanged, required this.isRememberMe});

  final bool isChecked;
  final void Function(bool?)? onChanged;
  final bool isRememberMe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 24.h,
      child: isRememberMe ?  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: VColors.primaryColor500),
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              checkColor: VColors.whiteColor,
              activeColor: VColors.primaryColor500,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              side: isChecked ? BorderSide.none : BorderSide(color: VColors.primaryColor500, width: 2.w),
            ),
          ),

          Text('Remember me', style: VStyles.bodyMediumSemiBold(context).copyWith(color: VColors.greyScale900)),
        ],
      ) : Theme(
        data: ThemeData(unselectedWidgetColor: VColors.primaryColor500),
        child: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          checkColor: VColors.whiteColor,
          activeColor: VColors.primaryColor500,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          side: isChecked ? BorderSide.none : BorderSide(color: VColors.primaryColor500, width: 2.w),
        ),
      ),
    );
  }
}
