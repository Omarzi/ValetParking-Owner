import '../../../../utils/constants/exports.dart';

class ShowLocationBottomSheet extends StatelessWidget {
  const ShowLocationBottomSheet({super.key, required this.map, required this.historyAddressesWidget});
  final Map map;
  final Widget historyAddressesWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: VDeviceUtils.getScreenHeight(context).h / 2.2,
      decoration: BoxDecoration(
          color: VColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text("Delivery to",style: VStyles.h6Bold(context)),
            ),
            SizedBox(height: 15.h),
            // AddNewAddressWidget(onTap: () => context.pushNamed(VRoutesName.choiceYourLocationRoute, arguments: map)),
            SizedBox(height: 15.h),
            Expanded(
              child: historyAddressesWidget,
            ),
          ],
        ),
      ),
    );
  }
}

/// Add New Address Widget
class AddNewAddressWidget extends StatelessWidget {
  const AddNewAddressWidget({super.key ,required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                  color: VColors.greyScale300,
                  width: 0.6.w
              ),
              color: VColors.whiteColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add_circle,color: VColors.primaryColor500,size: 25.sp,),
              SizedBox(width: 10.w),
              Text("Add New Address",style: VStyles.h6Bold(context))
            ],
          ),

        ),
      ),
    );
  }
}

/// Previous Address Widget
class PreviousAddressesWidget extends StatelessWidget {
  const PreviousAddressesWidget({super.key,required this.icon, required this.addressName, required this.location, required this.onTap, required this.onTapInEdit});
  final Widget icon;
  final String addressName, location;
  final void Function() onTap, onTapInEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: InkWellWidget(
        onTap: onTap,
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
        decoration: BoxDecoration(
            color: VColors.whiteColor,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              width: 0.4.w,
              color: VColors.greyScale300,
            )
        ),
        child:   Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: icon,
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(left: 8.w),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(addressName,style: VStyles.bodyLargeBold(context).copyWith(color: VColors.greyScale800)),
                        SizedBox(height: 4.h),
                        Text(location, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWellWidget(onTap: onTapInEdit, child: Text('Edit',style: TextStyle(color: VColors.primaryColor500))),
            ),
          ],
        ),

      ),
      ),
    );
  }
}