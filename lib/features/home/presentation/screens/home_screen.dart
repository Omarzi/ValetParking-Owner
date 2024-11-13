import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    HomeCubit.get(context).getAllDriversAndGarageDetailsFunction();
    HomeCubit.get(context).getAllUsersFunction();
    HomeCubit.get(context).getAllSubOwnersFunction();
    HomeCubit.get(context).getAllGaragesFunction();
    HomeCubit.get(context).getAllAttendancesInTodayFunction();
    super.initState();
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
                  AppLocalizations.of(context)!.translate('home')!,
                  style: VStyles.h4Bold(context),
                ),
              ),
              leading:  Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: SvgPicture.asset(VImages.appBarIcon, width: 32.w),
              ),
              actions: [
                GestureDetector(
                  onTap: () => VDeviceUtils.showCustomBottomSheet(
                      context: context, widget: const ChangeLanguageWidget()),
                  child: Padding(
                    padding: EdgeInsets.only(right: 22.w),
                    child: Image.asset('assets/images/pngs/language.png',
                      width: 30.w,
                      fit: BoxFit.scaleDown,
                      // style: VStyles.bodyLargeBold(context).copyWith(
                      //   fontSize: 30.sp,
                      // ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () => context.pushNamed(VRoutesName.addWalletRoute),
                  child: Padding(
                    padding: EdgeInsets.only(right: 22.w),
                    child: Text('💳',
                      style: VStyles.bodyLargeBold(context).copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
                // ),
              ],
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              right: 32.w,
              left: 32.w,
              bottom: 48.h,
            ),
            child: Column(
              children: [
                /// Make Space
                SizedBox(height: 24.h),

                Text(
                AppLocalizations.of(context)!.translate('chooseFromFollowing')!,
                  style: VStyles.h4Bold(context),
                  // textAlign: TextAlign.center,
                ),

                /// Make Space
                SizedBox(height: 24.h),

                Text(
                  AppLocalizations.of(context)!.translate('choice')!,
                  style: VStyles.h2Bold(context).copyWith(
                    color: VColors.primaryColor500,
                  ),
                  textAlign: TextAlign.center,
                ),

                /// Make Space
                SizedBox(height: 36.h),

                /// All Places Button
                // MainButtonWidget(
                //   centerWidgetInButton: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Icon(Iconsax.building_copy, color: Colors.white),
                //       // SvgPicture.asset(VImages.bookingIconNotSelected, color: VColors.whiteColor),
                //       SizedBox(width: 8.w),
                //       Text(
                //         'All places',
                //         style: VStyles.bodyLargeBold.copyWith(
                //           color: VColors.whiteColor,
                //         ),
                //       ),
                //     ],
                //   ),
                //   onTap: () => context.pushNamed(VRoutesName.allOrdersRoute),
                //   margin: EdgeInsets.zero,
                //   buttonColor: VColors.gradientPrimary100,
                //   boxShadow: [AppBoxShadows.buttonShadowOne],
                // ),
                //
                // /// Make Space
                // SizedBox(height: 24.h),

                /// All Drivers Button
                MainButtonWidget(
                  centerWidgetInButton: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.personalcard_copy, color: Colors.white),
                      // SvgPicture.asset(VImages.bookingIconNotSelected, color: VColors.whiteColor),
                      SizedBox(width: 8.w),
                      Text(
                        AppLocalizations.of(context)!.translate('allDrivers')!,
                        style: VStyles.bodyLargeBold(context).copyWith(
                          color: VColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => context.pushNamed(VRoutesName.allDriversRoute),
                  margin: EdgeInsets.zero,
                  buttonColor: VColors.gradientPrimary100,
                  boxShadow: [AppBoxShadows.buttonShadowOne],
                ),

                /// Make Space
                SizedBox(height: 24.h),

                /// All Owners Button
                MainButtonWidget(
                  centerWidgetInButton: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.percentage_square_copy, color: VColors.primaryColor500),
                      // SvgPicture.asset(VImages.bookingIconNotSelected, color: VColors.whiteColor),
                      SizedBox(width: 8.w),
                      Text(
                        AppLocalizations.of(context)!.translate('allSubOwners')!,
                        style: VStyles.bodyLargeBold(context).copyWith(
                          color: VColors.primaryColor500,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => context.pushNamed(VRoutesName.allSubOwnersRoute),
                  margin: EdgeInsets.zero,
                  buttonColor: VColors.primaryColor100,
                  boxShadow: [],
                ),

                /// Make Space
                SizedBox(height: 24.h),

                /// All Garages Button
                MainButtonWidget(
                  centerWidgetInButton: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.personalcard_copy, color: Colors.white),
                      // SvgPicture.asset(VImages.bookingIconNotSelected, color: VColors.whiteColor),
                      SizedBox(width: 8.w),
                      Text(
                        AppLocalizations.of(context)!.translate('allGarages')!,
                        style: VStyles.bodyLargeBold(context).copyWith(
                          color: VColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => context.pushNamed(VRoutesName.allGaragesRoute),
                  margin: EdgeInsets.zero,
                  buttonColor: VColors.gradientPrimary100,
                  boxShadow: [AppBoxShadows.buttonShadowOne],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: VDeviceUtils.getScreenHeight(context) / 3.6,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
      child: Column(
        children: [
          /// Make Space
          SizedBox(height: 35.h),

          SizedBox(width: double.infinity, height: VDeviceUtils.getScreenHeight(context) / 26, child: Text(AppLocalizations.of(context)!.translate('changeLanguage')!, style: VStyles.h4Bold(context).copyWith(color: VColors.alertsAndStatusError), textAlign: TextAlign.center)),

          /// Make Space
          SizedBox(height: 24.h),

          Container(width: double.infinity, height: 1.w, color: VColors.greyScale200,),

          /// Make Space
          SizedBox(height: 24.h),

          SizedBox(width: double.infinity, height: VDeviceUtils.getScreenHeight(context) / 26, child: Text(AppLocalizations.of(context)!.translate('choiceFromTwoLanguages')!, style: VStyles.h5Bold(context).copyWith(color: VColors.greyScale800), textAlign: TextAlign.center)),

          /// Make Space
          SizedBox(height: 12.h),

          InkWellWidget(
            onTap: () {
              VCacheHelper.putString(key: CacheKeys.lang, value: 'ar');
              BlocProvider.of<LocaleCubit>(context).toArabic();
              context.pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: VDeviceUtils.getScreenHeight(context) / 26, child: Text(AppLocalizations.of(context)!.translate('arabic')!, style: VStyles.h5Bold(context).copyWith(color: AppLocalizations.of(context)!.isEnLocale ? VColors.greyScale800 : VColors.primaryColor500))),
                SvgPicture.asset(
                  VImages.checkIcon,
                  height: 18.h,
                  colorFilter: ColorFilter.mode(
                    AppLocalizations.of(context)!.isEnLocale ? VColors.greyScale900 : VColors.primaryColor500,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),

          /// Make Space
          SizedBox(height: 12.h),

          InkWellWidget(
            onTap: () {
              VCacheHelper.putString(key: CacheKeys.lang, value: 'en');
              BlocProvider.of<LocaleCubit>(context).toEnglish();
              context.pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: VDeviceUtils.getScreenHeight(context) / 26, child: Text(AppLocalizations.of(context)!.translate('english')!, style: VStyles.h5Bold(context).copyWith(color: AppLocalizations.of(context)!.isEnLocale ? VColors.primaryColor500 : VColors.greyScale800))),
                SvgPicture.asset(
                  VImages.checkIcon,
                  height: 18.h,
                  colorFilter: ColorFilter.mode(
                    AppLocalizations.of(context)!.isEnLocale ? VColors.primaryColor500 : VColors.greyScale900,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
