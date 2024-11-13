import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class AddWalletScreen extends StatefulWidget {
  const AddWalletScreen({super.key});

  @override
  State<AddWalletScreen> createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {
  TextEditingController moneyController = TextEditingController();
  final FocusNode moneyFocusNode = FocusNode();
  bool isMoneyFieldFocused = false;
  final List<String> users = [
    'User 1',
    'User 2',
    'User 3',
    'User 4'
  ]; // Sample user list
  String selectedUser = 'Click here... to choose specific user ---';

  @override
  void initState() {
    super.initState();

    /// Add listener to focus node
    moneyFocusNode.addListener(
        () => setState(() => isMoneyFieldFocused = moneyFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    moneyFocusNode.dispose();
    moneyController.dispose();
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
                  "💳 ${AppLocalizations.of(context)!.translate('addMoneyToUser')!}",
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
            if(state is AddWalletSuccessState) {
              moneyController.clear();
              selectedUser = AppLocalizations.of(context)!.translate('clickHereToChooseSpecificUser')!;
              FloatingSnackBar.show(
                context: context,
                message: AppLocalizations.of(context)!.translate('addMoneySuccessfully')!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.success,
              );
            } else if(state is AddWalletErrorState) {
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
            var addWalletCubit = HomeCubit.get(context);
            var usersList = addWalletCubit.getAllUserDataModel.data;

            return SingleChildScrollView(
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

                    TextFormFieldWidget(
                      controller: moneyController,
                      textInputType: TextInputType.number,
                      focusNode: moneyFocusNode,
                      hintText: AppLocalizations.of(context)!.translate('addBalance')!,
                      hintColor: isMoneyFieldFocused
                          ? VColors.primaryColor500
                          : VColors.greyScale500,
                      prefixIcon: Icon(
                        Iconsax.wallet,
                        color: isMoneyFieldFocused
                            ? VColors.primaryColor500
                            : moneyController.text.isNotEmpty
                                ? VColors.greyScale900
                                : VColors.greyScale500,
                      ),
                      fillColor: isMoneyFieldFocused
                          ? VColors.purpleTransparent.withOpacity(.08)
                          : VColors.greyScale50,
                      borderSide: isMoneyFieldFocused
                          ? BorderSide(color: VColors.primaryColor500)
                          : BorderSide.none,
                      obscureText: false,
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    // GestureDetector(
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return Dialog(
                    //           backgroundColor: Colors.white,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(12.r),
                    //           ),
                    //           child: Container(
                    //             padding: EdgeInsets.all(16.w),
                    //             child: Column(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text(
                    //                   'Choose a User',
                    //                   style: VStyles.h6Bold.copyWith(
                    //                     color: VColors.primaryColor500,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 16.h),
                    //                 usersList == null
                    //                     ? Center(
                    //                         child: Column(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.center,
                    //                           children: [
                    //                             Text(
                    //                               'Have an a problem in get saved items',
                    //                               style: VStyles.h6Bold,
                    //                               textAlign: TextAlign.center,
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       )
                    //                     : usersList == [] || usersList.isEmpty
                    //                         ? const Center(
                    //                             child:
                    //                                 CircularProgressIndicator())
                    //                         : Container(
                    //                             height: 200
                    //                                 .h, // Set height for ListView
                    //                             child: ListView.builder(
                    //                               shrinkWrap: true,
                    //                               itemCount: usersList.length,
                    //                               itemBuilder:
                    //                                   (context, index) {
                    //                                 return ListTile(
                    //                                   title: Text(
                    //                                     usersList[index]
                    //                                             .username ??
                    //                                         'No have username',
                    //                                     style: VStyles
                    //                                         .bodyXLargeSemiBold,
                    //                                   ),
                    //                                   onTap: () {
                    //                                     setState(() {
                    //                                       selectedUser = usersList[
                    //                                                   index]
                    //                                               .username ??
                    //                                           'No have username';
                    //                                     });
                    //                                     Navigator.of(context)
                    //                                         .pop();
                    //                                     // You can handle the user selection here
                    //                                     print(
                    //                                         'Selected: ${users[index]}');
                    //                                   },
                    //                                 );
                    //                               },
                    //                             ),
                    //                           ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 12.w, vertical: 16.h),
                    //     decoration: BoxDecoration(
                    //       color: VColors.greyScale50,
                    //       // Replace with your VColors.greyScale50
                    //       borderRadius: BorderRadius.circular(12.r),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Icon(Iconsax.personalcard_copy, size: 27.sp),
                    //         // Replace with your icon
                    //         SizedBox(width: 12.w),
                    //         Text(
                    //           selectedUser,
                    //           style: VStyles.bodyMediumRegular,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                                      AppLocalizations.of(context)!.translate('chooseUser')!,
                                      style: VStyles.h6Bold(context).copyWith(
                                        color: VColors.primaryColor500,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    usersList == null
                                        ? Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.translate('haveAnAProblemInGetSavedItems')!,
                                            style: VStyles.h6Bold(context),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )
                                        : usersList == [] || usersList.isEmpty
                                        ? const Center(child: CircularProgressIndicator())
                                        : SizedBox(
                                      height: 200.h, // Set height for ListView
                                      child: Scrollbar(
                                        thumbVisibility: true, // This shows the scrollbar thumb always
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: usersList.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(
                                                usersList[index].username ?? 'No username available',
                                                style: VStyles.bodyXLargeSemiBold(context),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  selectedUser = usersList[index].username ?? 'No username available';
                                                  VCacheHelper.putString(key: CacheKeys.userId, value: usersList[index].userId!);
                                                });
                                                Navigator.of(context).pop();
                                                print('Selected: ${usersList[index]}');
                                              },
                                            );
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
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: VColors.greyScale50,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Iconsax.personalcard_copy, size: 27.sp),
                            SizedBox(width: 12.w),
                            Text(
                              selectedUser,
                              style: VStyles.bodyMediumRegular(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    MainButtonWidget(
                      centerWidgetInButton: state is AddWalletLoadingState
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(AppLocalizations.of(context)!.translate('continue')!,
                          style: VStyles.bodyLargeBold(context)
                              .copyWith(color: VColors.whiteColor)),
                      onTap: () {
                        String money = moneyController.text;

                        if (money.isEmpty) {
                          FloatingSnackBar.show(
                            context: context,
                            message: AppLocalizations.of(context)!.translate('youMustFillOutThisField')!,
                            textColor: Colors.white,
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: VColors.error,
                          );
                        }

                        else {
                          addWalletCubit.addWalletToSpecificUserFunction(userId: VCacheHelper.getString(key: CacheKeys.userId)!, wallet: double.parse(money));
                        }

                      },
                      margin: EdgeInsets.zero,
                      buttonColor: moneyController.text.isEmpty
                          ? VColors.disabledButton
                          : VColors.primaryColor500,
                      boxShadow: moneyController.text.isEmpty
                          ? []
                          : [AppBoxShadows.buttonShadowOne],
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
