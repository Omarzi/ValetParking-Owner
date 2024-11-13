import 'package:valetparking_owner/utils/constants/exports.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({super.key, required this.selectedItem, required this.items, required this.isInFillProfile, this.onItemSelected});

  String selectedItem;
  final List<String> items;
  bool isInFillProfile = false;
  final Function(String?)? onItemSelected;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    String? validSelectedItem = widget.items.contains(widget.selectedItem) ? widget.selectedItem : widget.items[0];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: VColors.greyScale50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.only(left: 14.w),
      child: DropdownButton(
        value: validSelectedItem,
        onChanged: (gender) {
          setState(() => widget.selectedItem = gender!);
          if (widget.onItemSelected != null) {
            widget.onItemSelected!(gender);
          }
        },
        items: widget.items.map((gender) => DropdownMenuItem(value: gender, child: Text(gender, style: VStyles.bodyMediumSemiBold(context).copyWith(color: widget.isInFillProfile ? VColors.greyScale900 : VColors.blackColor)))).toList(),
        isExpanded: true,
        icon: IconButton(onPressed: null, icon: SvgPicture.asset(VImages.arrowButton, color: widget.isInFillProfile ? VColors.greyScale500 : VColors.blackColor)),
        underline: Container(),
        dropdownColor: VColors.greyScale50,
      ),
    );
  }
}
