import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:intl/intl.dart';

class AttendancesInEndScreen extends StatefulWidget {
  const AttendancesInEndScreen({super.key});

  @override
  State<AttendancesInEndScreen> createState() => _AttendancesInEndScreenState();
}

class _AttendancesInEndScreenState extends State<AttendancesInEndScreen> {
  bool makeFilter = false;

  TextEditingController filterToController = TextEditingController();
  TextEditingController filterFromController = TextEditingController();
  final FocusNode filterToFocusNode = FocusNode();
  final FocusNode filterFromFocusNode = FocusNode();
  bool isFilterToFieldFocused = false;
  bool isFilterFromFieldFocused = false;

  @override
  void initState() {
    super.initState();

    /// Add listener to focus node
    filterFromFocusNode.addListener(() => setState(
            () => isFilterFromFieldFocused = filterFromFocusNode.hasFocus));
    filterToFocusNode.addListener(() =>
        setState(() => isFilterToFieldFocused = filterToFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    filterFromFocusNode.dispose();
    filterFromController.dispose();
    filterToFocusNode.dispose();
    filterToController.dispose();
    super.dispose();
  }

  Future<void> selectDate1(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: VColors.primaryColor500,

            /// Header background color
            colorScheme: ColorScheme.light(
              primary: VColors.primaryColor500,

              /// Header background color
              onPrimary: Colors.white,

              /// Header text color
              onSurface: VColors.greyScale900,
            ),
            dialogBackgroundColor: Colors.white,

            /// Background color of the dialog
            buttonTheme: ButtonThemeData(
              buttonColor: VColors.primaryColor500,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        filterFromController.text = DateFormat('yyyy-MM-dd').format(selectedDate); // Changed format
      });
    }
  }

  Future<void> selectDate2(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: VColors.primaryColor500,

            /// Header background color
            colorScheme: ColorScheme.light(
              primary: VColors.primaryColor500,

              /// Header background color
              onPrimary: Colors.white,

              /// Header text color
              onSurface: VColors.greyScale900,
            ),
            dialogBackgroundColor: Colors.white,

            /// Background color of the dialog
            buttonTheme: ButtonThemeData(
              buttonColor: VColors.primaryColor500,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        filterToController.text = DateFormat('yyyy-MM-dd').format(selectedDate); // Changed format
      });
    }
  }

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
                    AppLocalizations.of(context)!.translate('attendancesInStart')!,
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
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var getAttendancesInStartCubit = HomeCubit.get(context);
              var attendancesList =
                  getAttendancesInStartCubit.getAttendanceInStartModel.data;

              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    right: 32.w,
                    left: 32.w,
                    bottom: 48.h,
                  ),
                  child: getAttendancesInStartCubit
                      .getAttendanceInTodayModel.attend ==
                      null
                      ? LoadingWidget(iconColor: VColors.primaryColor500)
                      : Column(
                    children: [
                      /// Make Space
                      SizedBox(height: 24.h),

                      // if (makeFilter)
                      Column(
                        children: [
                          TextFormFieldWidget(
                            controller: filterFromController,
                            textInputType: TextInputType.number,
                            focusNode: filterFromFocusNode,
                            hintText: AppLocalizations.of(context)!.translate('from')!,
                            hintColor: isFilterFromFieldFocused
                                ? VColors.primaryColor500
                                : VColors.greyScale500,
                            readOnly: true,
                            prefixIcon: Icon(
                              Iconsax.filter_search_copy,
                              color: isFilterFromFieldFocused
                                  ? VColors.primaryColor500
                                  : filterFromController.text.isNotEmpty
                                  ? VColors.greyScale900
                                  : VColors.greyScale500,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                selectDate1(context);
                              },
                              child: const ChoiceContainerInSuffixIcon(),
                            ),
                            fillColor: isFilterFromFieldFocused
                                ? VColors.purpleTransparent.withOpacity(.08)
                                : VColors.greyScale50,
                            borderSide: isFilterFromFieldFocused
                                ? BorderSide(color: VColors.primaryColor500)
                                : BorderSide.none,
                            obscureText: false,
                            inputFormatters: [DateInputFormatter2()],
                          ),

                          /// Make Space
                          SizedBox(height: 24.h),
                          TextFormFieldWidget(
                            controller: filterToController,
                            textInputType: TextInputType.number,
                            focusNode: filterToFocusNode,
                            readOnly: true,
                            hintText: AppLocalizations.of(context)!.translate('to')!,
                            hintColor: isFilterToFieldFocused
                                ? VColors.primaryColor500
                                : VColors.greyScale500,
                            prefixIcon: Icon(
                              Iconsax.filter_search_copy,
                              color: isFilterToFieldFocused
                                  ? VColors.primaryColor500
                                  : filterToController.text.isNotEmpty
                                  ? VColors.greyScale900
                                  : VColors.greyScale500,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                selectDate2(context);
                              },
                              child: const ChoiceContainerInSuffixIcon(),
                            ),
                            fillColor: isFilterToFieldFocused
                                ? VColors.purpleTransparent.withOpacity(.08)
                                : VColors.greyScale50,
                            borderSide: isFilterToFieldFocused
                                ? BorderSide(color: VColors.primaryColor500)
                                : BorderSide.none,
                            obscureText: false,
                            inputFormatters: [DateInputFormatter2()],
                          ),

                          /// Make Space
                          SizedBox(height: 16.h),

                          /// Two Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  try {
                                    // Define date format
                                    DateFormat inputFormat =
                                    DateFormat('dd-MM-yyyy');
                                    DateFormat outputFormat =
                                    DateFormat('yyyy-MM-dd');

                                    // Parse the input date strings
                                    DateTime fromDate = inputFormat
                                        .parse(filterFromController.text);
                                    DateTime toDate = inputFormat
                                        .parse(filterToController.text);

                                    // Format the parsed dates into 'YYYY-MM-DD'
                                    String formattedFromDate =
                                    outputFormat.format(fromDate);
                                    String formattedToDate =
                                    outputFormat.format(toDate);

                                    logSuccess(filterFromController.text);
                                    logSuccess(filterToController.text);

                                    getAttendancesInStartCubit
                                        .getAllAttendancesInEndFunction(
                                      createdAtGTE:
                                      filterFromController.text,
                                      createdAtLTE: filterToController.text,
                                    );
                                  } catch (e) {
                                    // Handle potential date parsing errors
                                    print('Date parsing error: $e');
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 40.w),
                                  decoration: BoxDecoration(
                                    color: VColors.primaryColor500,
                                    borderRadius:
                                    BorderRadius.circular(100.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!.translate('search')!,
                                      style: VStyles.bodyLargeSemiBold
                                          (context).copyWith(
                                        color: VColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// Make Space
                      // if (makeFilter)
                      SizedBox(height: 24.h),

                      state is GetAllAttendancesInEndLoadingState
                          ? LoadingWidget(
                          iconColor: VColors.primaryColor500)
                          : attendancesList == null
                          ? Center(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.translate('noAttendanceRecordsFoundForToday')!,
                              style: VStyles.h6Bold(context),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                          : attendancesList == [] ||
                          attendancesList.isEmpty
                          ? const Center(
                          child: CircularProgressIndicator())
                          : SizedBox(
                        width: double.infinity,
                        height: VDeviceUtils.getScreenHeight(
                            context) /
                            1.2,
                        // color: Colors.red,
                        child: ListView.separated(
                          itemCount: attendancesList.length,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 20.h),
                                const Divider(),
                                SizedBox(height: 20.h),
                              ],
                            );
                          },
                          itemBuilder: (context, index) {
                            var atte = attendancesList[index];
                            var garageList = atte.garage;
                            return Container(
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                color: VColors.greyScale50,
                                border: Border.all(
                                  color: VColors.greyScale300,
                                  width: 1.w,
                                ),
                                borderRadius:
                                BorderRadius.circular(
                                    18.r),
                              ),
                              padding:
                              const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  // Display driver's salary
                                  Container(
                                    // width: VDeviceUtils.getScreenWidth(context) / 1.5,
                                    child: Text(
                                      '${AppLocalizations.of(context)!.translate('driverEmail')} ${atte.driver!.email.toString()}',
                                      style: VStyles.h6Bold(context)
                                          .copyWith(
                                          color: VColors
                                              .primaryColor500),
                                      overflow:
                                      TextOverflow.clip,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garageName')}${atte.garage?.garageName.toString()}',
                                    style: VStyles
                                        .bodyLargeSemiBold(context)
                                        .copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garageDescription')}${atte.garage?.garageDescription.toString()}',
                                    style: VStyles
                                        .bodyLargeSemiBold
                                        (context).copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garageLocation')}${atte.garage?.lat.toString()} - ${atte.garage?.lng.toString()}',
                                    style: VStyles
                                        .bodyLargeSemiBold
                                        (context).copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('openDate')}${atte.garage?.openDate.toString()}',
                                    style: VStyles
                                        .bodyLargeSemiBold
                                        (context).copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('endDate')}${atte.garage?.endDate.toString()}',
                                    style: VStyles
                                        .bodyLargeSemiBold
                                        (context).copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('ifHaveSpace')}${atte.garage?.active == true ? 'Yes' : 'No'}',
                                    style: VStyles
                                        .bodyLargeSemiBold
                                        (context).copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),

                                  SizedBox(height: 8.h),

                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garagePricePerHour')}${atte.garage?.garagePricePerHour} EGP',
                                    style: VStyles
                                        .bodyLargeSemiBold
                                        (context).copyWith(
                                        color: VColors
                                            .greyScale700),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}

class ChoiceContainerInSuffixIcon extends StatelessWidget {
  const ChoiceContainerInSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: VDeviceUtils.getScreenWidth(context) / 5,
      decoration: BoxDecoration(
        // color: Colors.red,
        color: VColors.primaryColor500,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.translate('choice')!,
          style: VStyles.bodyMediumRegular(context).copyWith(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
