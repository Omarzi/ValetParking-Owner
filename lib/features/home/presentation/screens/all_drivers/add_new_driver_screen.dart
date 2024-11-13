import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_places/garages/garage_map_screen.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class AddNewDriverScreen extends StatefulWidget {
  const AddNewDriverScreen({super.key, required this.screenName});

  final String screenName;

  @override
  State<AddNewDriverScreen> createState() => _AddNewDriverScreenState();
}

class _AddNewDriverScreenState extends State<AddNewDriverScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode salaryFocusNode = FocusNode();
  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;
  bool isSalaryFieldFocused = false;
  bool isChecked = false;
  bool isShown = false;
  bool isPass = true;
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  final FocusNode latitudeFocusNode = FocusNode();
  final FocusNode longitudeFocusNode = FocusNode();
  String selectedGarage = 'Click here... to choose specific garage ---';
  LatLng? selectedLocation;

  Future<void> _selectLocation(BuildContext context) async {
    final LatLng? location = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoogleMapScreen(),
      ),
    );

    if (location != null) {
      setState(() {
        selectedLocation = location;
        latitudeController.text = location.latitude.toString();
        longitudeController.text = location.longitude.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    /// Add listener to focus node
    emailFocusNode.addListener(
        () => setState(() => isEmailFieldFocused = emailFocusNode.hasFocus));
    passwordFocusNode.addListener(() =>
        setState(() => isPasswordFieldFocused = passwordFocusNode.hasFocus));
    salaryFocusNode.addListener(
        () => setState(() => isSalaryFieldFocused = salaryFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    salaryFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    salaryController.dispose();
    super.dispose();
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
                  widget.screenName == 'driver'
                      ? AppLocalizations.of(context)!.translate('addDriver')!
                      : AppLocalizations.of(context)!.translate('addSubOwner')!,
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
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is AddDriverSuccessState) {
              FloatingSnackBar.show(
                context: context,
                message: widget.screenName == 'driver'
                    ? AppLocalizations.of(context)!.translate('addDriverSuccessfully')!
                    : AppLocalizations.of(context)!.translate('addSubOwnerSuccessfully')!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.success,
              );
              context.pushNamedAndRemoveUntil(VRoutesName.homeRoute,
                  predicate: (route) => false);
            } else if (state is AddDriverErrorState) {
              FloatingSnackBar.show(
                context: context,
                message: state.message!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.error,
              );
            }
          },
          builder: (context, state) {
            var addDriverCubit = HomeCubit.get(context);
            var garageList = addDriverCubit.getAllGaragesModel.garageDetails;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  right: 32.w,
                  left: 32.w,
                  bottom: 48.h,
                ),
                child: Column(
                  children: [
                    /// Email
                    TextFormFieldWidget(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      hintText:
                          AppLocalizations.of(context)!.translate('email')!,
                      hintColor: isEmailFieldFocused
                          ? VColors.primaryColor500
                          : VColors.greyScale500,
                      prefixIcon: SvgPicture.asset(VImages.email2Icon,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              isEmailFieldFocused
                                  ? VColors.primaryColor500
                                  : emailController.text.isNotEmpty
                                      ? VColors.greyScale900
                                      : VColors.greyScale500,
                              BlendMode.srcIn)),
                      fillColor: isEmailFieldFocused
                          ? VColors.purpleTransparent.withOpacity(.08)
                          : VColors.greyScale50,
                      borderSide: isEmailFieldFocused
                          ? BorderSide(color: VColors.primaryColor500)
                          : BorderSide.none,
                      obscureText: false,
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    /// Password
                    TextFormFieldWidget(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      focusNode: passwordFocusNode,
                      hintText:
                          AppLocalizations.of(context)!.translate('password')!,
                      hintColor: isPasswordFieldFocused
                          ? VColors.primaryColor500
                          : VColors.greyScale500,
                      prefixIcon: SvgPicture.asset(VImages.passwordIcon,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              isPasswordFieldFocused
                                  ? VColors.primaryColor500
                                  : passwordController.text.isNotEmpty
                                      ? VColors.greyScale900
                                      : VColors.greyScale500,
                              BlendMode.srcIn)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() => isPass = !isPass);
                        },
                        child: SvgPicture.asset(
                            isPass ? VImages.eyeHideIcon : VImages.eyeShowIcon,
                            fit: BoxFit.scaleDown,
                            colorFilter: ColorFilter.mode(
                                isPasswordFieldFocused
                                    ? VColors.primaryColor500
                                    : passwordController.text.isNotEmpty
                                        ? VColors.greyScale900
                                        : VColors.greyScale500,
                                BlendMode.srcIn)),
                      ),
                      fillColor: isPasswordFieldFocused
                          ? VColors.purpleTransparent.withOpacity(.08)
                          : VColors.greyScale50,
                      borderSide: isPasswordFieldFocused
                          ? BorderSide(color: VColors.primaryColor500)
                          : BorderSide.none,
                      obscureText: isPass,
                      obscureCharacter: '●',
                      maxLines: 1,
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    /// Salary
                    TextFormFieldWidget(
                      controller: salaryController,
                      textInputType: TextInputType.number,
                      focusNode: salaryFocusNode,
                      hintText: AppLocalizations.of(context)!.translate('salary')!,
                      hintColor: isSalaryFieldFocused
                          ? VColors.primaryColor500
                          : VColors.greyScale500,
                      prefixIcon: Icon(
                        Iconsax.money_copy,
                        color: isSalaryFieldFocused
                            ? VColors.primaryColor500
                            : salaryController.text.isNotEmpty
                                ? VColors.greyScale900
                                : VColors.greyScale500,
                      ),
                      fillColor: isSalaryFieldFocused
                          ? VColors.purpleTransparent.withOpacity(.08)
                          : VColors.greyScale50,
                      borderSide: isSalaryFieldFocused
                          ? BorderSide(color: VColors.primaryColor500)
                          : BorderSide.none,
                      obscureText: false,
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.translate('chooseGarage')!,
                                      style: VStyles.h6Bold(context).copyWith(
                                        color: VColors.primaryColor500,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    garageList == null
                                        ? Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!.translate('haveAnAProblemInGetSavedItems')!,
                                                  style:
                                                      VStyles.h6Bold(context),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )
                                        : garageList == [] || garageList.isEmpty
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : SizedBox(
                                                height: 200
                                                    .h, // Set height for ListView
                                                child: Scrollbar(
                                                  thumbVisibility: true,
                                                  // This shows the scrollbar thumb always
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        garageList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return garageList[index]
                                                                  .driver ==
                                                              null
                                                          ? ListTile(
                                                              title: Text(
                                                                garageList[index]
                                                                        .gragename ??
                                                                    'No username available',
                                                                style: VStyles
                                                                    .bodyXLargeSemiBold(
                                                                        context),
                                                              ),
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedGarage =
                                                                      garageList[index]
                                                                              .gragename ??
                                                                          'No username available';
                                                                  VCacheHelper.putString(
                                                                      key: CacheKeys
                                                                          .garageId,
                                                                      value: garageList[
                                                                              index]
                                                                          .garageId!);
                                                                });
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                print(
                                                                    'Selected: ${garageList[index]}');
                                                              },
                                                            )
                                                          : SizedBox.shrink();
                                                    },
                                                  ),
                                                ),
                                              ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: VColors.greyScale50,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Iconsax.personalcard_copy, size: 27.sp),
                            SizedBox(width: 12.w),
                            Text(
                              selectedGarage,
                              style: VStyles.bodyMediumRegular(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    SizedBox(height: 24.h),

                    /// Lat and Lng Buttons
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: latitudeController,
                            textInputType: TextInputType.text,
                            focusNode: latitudeFocusNode,
                            hintText: AppLocalizations.of(context)!.translate('garageLat')!,
                            hintColor: VColors.greyScale500,
                            prefixIcon: Icon(Iconsax.location, size: 26.sp),
                            fillColor: VColors.greyScale50,
                            borderSide: BorderSide.none,
                            obscureText: false,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: longitudeController,
                            textInputType: TextInputType.text,
                            focusNode: longitudeFocusNode,
                            hintText: AppLocalizations.of(context)!.translate('garageLng')!,
                            hintColor: VColors.greyScale500,
                            prefixIcon: Icon(Iconsax.location, size: 26.sp),
                            fillColor: VColors.greyScale50,
                            borderSide: BorderSide.none,
                            obscureText: false,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    ElevatedButton(
                      onPressed: () => _selectLocation(context),
                      child: Text(
                        AppLocalizations.of(context)!.translate('selectLocationOnMap')!,
                        style: VStyles.bodyLargeBold(context)
                            .copyWith(color: VColors.primaryColor500),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    MainButtonWidget(
                      centerWidgetInButton: state is AddDriverLoadingState
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Center(
                              child: Text(AppLocalizations.of(context)!.translate('continue')!,
                                  style: VStyles.bodyLargeBold(context)
                                      .copyWith(color: VColors.whiteColor)),
                            ),
                      margin: EdgeInsets.zero,
                      buttonColor: VColors.primaryColor500,
                      boxShadow: const [],
                      onTap: () async {
                        addDriverCubit.addDriverFunction(
                          email: emailController.text,
                          password: passwordController.text,
                          lat: double.parse(latitudeController.text),
                          lng: double.parse(longitudeController.text),
                          salary: double.parse(salaryController.text),
                          role: widget.screenName == 'driver'
                              ? AppLocalizations.of(context)!.translate('driver')!
                              : AppLocalizations.of(context)!.translate('subOwner')!,
                          garage: [
                            VCacheHelper.getString(key: CacheKeys.garageId)!
                          ],
                        );
                      },
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
