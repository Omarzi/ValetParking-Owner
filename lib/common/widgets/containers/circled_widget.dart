import 'package:valetparking_owner/utils/constants/exports.dart';

class CircledWidget extends StatelessWidget {
  const CircledWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 28.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: VColors.primaryColor500,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(100.r)),
      child: widget,
    );
  }
}
