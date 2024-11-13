import 'package:valetparking_owner/utils/constants/exports.dart';

class ThirdButtonWidget extends StatelessWidget {
  const ThirdButtonWidget({super.key, required this.isRejected, required this.widgetInButton, required this.textStyle, required this.containerColor,required this .width,required this.height, required this.borderRadius, required this.onTap});

  final bool isRejected;
  final Widget widgetInButton;
  final TextStyle textStyle;
  final Color containerColor;
  final double width;
  final double height;
  final double borderRadius;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(onTap: onTap, child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: Center(
        child: isRejected ? ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [VColors.gradientRed101, VColors.gradientRed2100],
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: widgetInButton,
        ) : widgetInButton,
      ),
    ));
  }
}