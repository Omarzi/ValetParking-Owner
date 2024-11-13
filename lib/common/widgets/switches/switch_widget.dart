import 'package:valetparking_owner/utils/constants/exports.dart';

class SwitchWidget extends StatefulWidget {
  // SwitchWidget({super.key, this.valueData = false});
  SwitchWidget({super.key, required this.onChanged, required this.valueData});

  bool? valueData;
  void Function(bool)? onChanged;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.valueData!,
      onChanged: (bool value) {
        setState(() => widget.onChanged?.call(value));
      },
      // onChanged: (bool value) {
      //   setState(() => widget.valueData = value);
      //   logSuccess(widget.valueData.toString());
      // },
      activeColor: VColors.primaryColor500,
      activeTrackColor: VColors.primaryColor500,
      inactiveTrackColor: VColors.greyScale200,
      trackOutlineWidth: MaterialStateProperty.all(0.w),
      trackColor: MaterialStateProperty.all(widget.valueData! ? VColors.primaryColor500 : VColors.greyScale200),
      trackOutlineColor: MaterialStateProperty.all(widget.valueData! ? VColors.primaryColor500 : VColors.greyScale200),
      thumbColor: MaterialStateProperty.all(VColors.whiteColor),
      thumbIcon: MaterialStateProperty.all(Icon(Icons.circle, color: VColors.whiteColor)),
    );
  }
}