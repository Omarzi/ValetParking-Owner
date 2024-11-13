import 'package:valetparking_owner/utils/constants/exports.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: Row(
        children: [
          Expanded(child: Container(height: 1.4.h, margin: EdgeInsets.only(left: 10.w, right: 16.w), color: VColors.greyScale200)),
          Text(text, style: VStyles.bodyXLargeSemiBold(context).copyWith(color: VColors.greyScale700)),
          Expanded(child: Container(height: 1.4.h, margin: EdgeInsets.only(left: 10.w, right: 16.w), color: VColors.greyScale200)),
        ],
      ),
    );
  }
}
