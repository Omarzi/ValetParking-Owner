import 'package:flutter/material.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class ChoiceAttendances extends StatefulWidget {
  const ChoiceAttendances({super.key});

  @override
  State<ChoiceAttendances> createState() => _ChoiceAttendancesState();
}

class _ChoiceAttendancesState extends State<ChoiceAttendances> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.whiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: VColors.whiteColor,
              title: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  AppLocalizations.of(context)!.translate('Attendances')!,
                  style: VStyles.h4Bold(context),
                ),
              ),
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.only(
            right: 32.w,
            left: 32.w,
            bottom: 48.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainButtonWidget(
                centerWidgetInButton: Text(AppLocalizations.of(context)!.translate('attendanceInToday')!, style: VStyles.h6Bold(context).copyWith(color: Colors.white)),
                margin: EdgeInsets.zero,
                buttonColor: VColors.primaryColor500,
                boxShadow: [],
                onTap: () => context.pushNamed(VRoutesName.attendancesRoute),
              ),

              SizedBox(height: 24.h),


              MainButtonWidget(
                centerWidgetInButton: Text(AppLocalizations.of(context)!.translate('attendancesInStart')!, style: VStyles.h6Bold(context).copyWith(color: VColors.greyScale900)),
                margin: EdgeInsets.zero,
                buttonColor: VColors.primaryColor100,
                boxShadow: [],
                onTap: () => context.pushNamed(VRoutesName.attendancesInStartRoute),
              ),

              SizedBox(height: 24.h),

              MainButtonWidget(
                centerWidgetInButton: Text(AppLocalizations.of(context)!.translate('attendancesInEnd')!, style: VStyles.h6Bold(context).copyWith(color: VColors.greyScale900)),
                margin: EdgeInsets.zero,
                buttonColor: VColors.primaryColor100,
                boxShadow: [],
                onTap: () => context.pushNamed(VRoutesName.attendancesInEndRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
