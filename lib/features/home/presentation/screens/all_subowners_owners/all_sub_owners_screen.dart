import 'package:flutter/material.dart';
import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:intl/intl.dart';

class AllSubOwnersScreen extends StatefulWidget {
  const AllSubOwnersScreen({super.key});

  @override
  State<AllSubOwnersScreen> createState() => _AllSubOwnersScreenState();
}

class _AllSubOwnersScreenState extends State<AllSubOwnersScreen> {
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
                  AppLocalizations.of(context)!.translate('subOwners')!,
                  style: VStyles.h4Bold(context),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => context.pushNamed(VRoutesName.addNewDriverRoute, arguments: 'subOwner'),
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Icon(Iconsax.add_circle_copy, color: VColors.primaryColor500),
                  ),
                ),
              ],
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
            if(state is DeleteSpecificDriverErrorState) {
              FloatingSnackBar.show(
                context: context,
                message: state.message!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.error,
              );
            } else if(state is DeleteSpecificDriverSuccessState) {
              FloatingSnackBar.show(
                context: context,
                message: state.message!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.success,
              );
              HomeCubit.get(context).getAllSubOwnersFunction();
            }
          },
          builder: (context, state) {
            var getAllSubOwnersCubit = HomeCubit.get(context);
            var subOwnersList =
                getAllSubOwnersCubit.getAllSubOwnerDataModel.data;

            return subOwnersList == null
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an a problem in get saved items',
                    style: VStyles.h6Bold(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
                : subOwnersList == [] || subOwnersList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  right: 32.w,
                  left: 32.w,
                  bottom: 48.h,
                ),
                child: getAllSubOwnersCubit
                    .getAllDriversAndGrarageDetailsModel
                    .data ==
                    null
                    ? LoadingWidget(
                    iconColor: VColors.primaryColor500)
                    : Column(
                  children: [
                    /// Make Space
                    SizedBox(height: 24.h),

                    SizedBox(
                      width: double.infinity,
                      height: VDeviceUtils.getScreenHeight(
                          context) /
                          1.2,
                      // color: Colors.red,
                      child: ListView.separated(
                        itemCount: subOwnersList.length,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: 20.h),
                              Divider(),
                              SizedBox(height: 20.h),
                            ],
                          );
                        },
                        itemBuilder: (context, index) {
                          var driver = subOwnersList[index];
                          var garageList = driver.garage;
                          return Container(
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              color: VColors.greyScale50,
                              border: Border.all(
                                color: VColors.greyScale300,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                // Display driver's salary
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: VDeviceUtils.getScreenWidth(context) / 1.5,
                                      child: Text(
                                        '${AppLocalizations.of(context)!.translate('email')}: ${driver.email.toString()}',
                                        style: VStyles.h6Bold(context).copyWith(color: VColors.primaryColor500),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        getAllSubOwnersCubit.deleteSpecificDriverFunction(driverId: driver.adminId!);
                                      },
                                      child: const Icon(Iconsax.profile_delete_copy, color: Colors.red),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                    '${AppLocalizations.of(context)!.translate('salary')}: ${driver.salary.toString()} kwd'),
                                SizedBox(height: 10.h),

                                garageList!.isNotEmpty
                                    ? Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: garageList
                                      .map<Widget>(
                                          (garage) {
                                        return Container(
                                          margin:
                                          EdgeInsets.only(
                                              bottom:
                                              10.h),
                                          padding:
                                          EdgeInsets.all(
                                              8.0),
                                          decoration:
                                          BoxDecoration(
                                            color: Colors
                                                .grey[200],
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                  '${AppLocalizations.of(context)!.translate('garageName')}: ${garage.gragename}',
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                              ),
                                              Text(
                                                  '${AppLocalizations.of(context)!.translate('garageDescription')!}: ${garage.grageDescription}',
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                              ),
                                              Text(
                                                  '${AppLocalizations.of(context)!.translate('garagePricePerHour')!}: ${garage.gragePricePerHoure}',
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                              ),
                                              Text(
                                                  '${AppLocalizations.of(context)!.translate('active')!}: ${garage.active == true ? "Yes" : "No"}',
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                              ),
                                              Text(
                                                '${AppLocalizations.of(context)!.translate('openDate')!}: ${garage.openDate != null ? DateFormat.jm().format(DateTime.parse(garage.openDate!)) : 'N/A'}',
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                              ),
                                              Text(
                                                '${AppLocalizations.of(context)!.translate('endDate')!}: ${garage.openDate != null ? DateFormat.jm().format(DateTime.parse(garage.endDate!)) : 'N/A'}',
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                )
                                    : Text('No garages available',
                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
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
