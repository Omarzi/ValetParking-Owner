import 'package:flutter/material.dart';
import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/features/home/models/drivers/get_all_drivers_and_garage_details_model.dart';
import 'package:valetparking_owner/features/home/models/garages/get_all_garages_model.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_places/map_screen.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:intl/intl.dart';

class AllGaragesScreen extends StatefulWidget {
  const AllGaragesScreen({super.key});

  @override
  State<AllGaragesScreen> createState() => _AllGaragesScreenState();
}

class _AllGaragesScreenState extends State<AllGaragesScreen> {
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
                  "${AppLocalizations.of(context)!.translate('allGarages')!}",
                  style: VStyles.h4Bold(context),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => context.pushNamed(VRoutesName.addNewGarageRoute),
                  child: Padding(
                    padding: EdgeInsets.only(right: 22.w),
                    child: const Icon(Iconsax.add_circle_copy),
                  ),
                )
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
            if (state is DeleteSpecificGarageErrorState) {
              FloatingSnackBar.show(
                context: context,
                message: state.message!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.error,
              );
            } else if (state is DeleteSpecificGarageSuccessState) {
              FloatingSnackBar.show(
                context: context,
                message: state.message!,
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.success,
              );
              HomeCubit.get(context).getAllGaragesFunction();
            }
          },
          builder: (context, state) {
            var allGaragesCubit = HomeCubit.get(context);
            var garagesList = allGaragesCubit.getAllGaragesModel.garageDetails;

            return garagesList == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.translate('haveAnAProblemInGetSavedItems')}',
                          style: VStyles.h6Bold(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : garagesList == [] ||
                        garagesList.isEmpty ||
                        state is DeleteSpecificGarageLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 32.w,
                            left: 32.w,
                            bottom: 48.h,
                          ),
                          child: allGaragesCubit
                                      .getAllGaragesModel.garageDetails ==
                                  null
                              ? LoadingWidget(
                                  iconColor: VColors.primaryColor500)
                              : Column(
                                  children: [
                                    /// Make Space
                                    SizedBox(height: 24.h),

                                    // Container(
                                    //   width: double.infinity,
                                    //   height: VDeviceUtils.getScreenHeight(
                                    //       context) /
                                    //       1.2,
                                    //   color: Colors.red,
                                    //   child: ListView.separated(
                                    //     itemCount: garagesList.length,
                                    //     padding: EdgeInsets.zero,
                                    //     separatorBuilder: (context, index) {
                                    //       return Column(
                                    //         children: [
                                    //           SizedBox(height: 20.h),
                                    //           Divider(),
                                    //           SizedBox(height: 20.h),
                                    //         ],
                                    //       );
                                    //     },
                                    //     itemBuilder: (context, index) {
                                    //       var garages = garagesList[index];
                                    //       var subOwnersList = garages.subOwner;
                                    //
                                    //       return Container(
                                    //         padding: EdgeInsets.all(8.0),
                                    //         child: Column(
                                    //           crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //           children: [
                                    //             // Display driver's salary
                                    //             Text(
                                    //                 'GarageName: ${garages.gragename.toString()}'),
                                    //             SizedBox(height: 10.h),
                                    //
                                    //             Text(
                                    //                 'DriversName: ${garages.driver?[0].name.toString()}'),
                                    //             SizedBox(height: 10.h),
                                    //
                                    //           ],
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    Container(
                                      width: double.infinity,
                                      height: VDeviceUtils.getScreenHeight(
                                              context) /
                                          1.2,
                                      // color: Colors.red,
                                      // child: ListView.separated(
                                      //   itemCount: garagesList.length,
                                      //   padding: EdgeInsets.zero,
                                      //   separatorBuilder: (context, index) {
                                      //     return Column(
                                      //       children: [
                                      //         SizedBox(height: 20.h),
                                      //         Divider(),
                                      //         SizedBox(height: 20.h),
                                      //       ],
                                      //     );
                                      //   },
                                      //   itemBuilder: (context, index) {
                                      //     var garage = garagesList[index];
                                      //     var subOwnersList = garage.subOwner ?? [];
                                      //     var driver = garage.driver?.isNotEmpty == true ? garage.driver![0] : null;
                                      //
                                      //     return Container(
                                      //       padding: EdgeInsets.all(8.0),
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.white,
                                      //         borderRadius: BorderRadius.circular(12.0),
                                      //         boxShadow: [
                                      //           BoxShadow(
                                      //             color: Colors.grey.withOpacity(0.5),
                                      //             spreadRadius: 2,
                                      //             blurRadius: 5,
                                      //             offset: Offset(0, 3), // changes position of shadow
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       child: Column(
                                      //         crossAxisAlignment: CrossAxisAlignment.start,
                                      //         children: [
                                      //           // Display garage name
                                      //           Text(
                                      //             'Garage Name: ${garage.gragename ?? 'N/A'}',
                                      //             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                      //           ),
                                      //           SizedBox(height: 10.h),
                                      //
                                      //           // Display driver's name if available
                                      //           if (driver != null)
                                      //             Text(
                                      //               'Driver Email: ${driver.email ?? 'N/A'}',
                                      //               style: TextStyle(fontSize: 14.sp),
                                      //             )
                                      //           else
                                      //             Text(
                                      //               'No Driver Assigned',
                                      //               style: TextStyle(fontSize: 14.sp, color: Colors.red),
                                      //             ),
                                      //           SizedBox(height: 10.h),
                                      //
                                      //           // Display list of sub-owners
                                      //           if (subOwnersList.isNotEmpty)
                                      //             Column(
                                      //               crossAxisAlignment: CrossAxisAlignment.start,
                                      //               children: [
                                      //                 Text(
                                      //                   'Sub Owners:',
                                      //                   style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                                      //                 ),
                                      //                 ...subOwnersList.map((subOwner) => Padding(
                                      //                   padding: EdgeInsets.symmetric(vertical: 4.h),
                                      //                   child: Text(
                                      //                     '- ${subOwner ?? 'N/A'}',
                                      //                     style: TextStyle(fontSize: 14.sp),
                                      //                   ),
                                      //                 )),
                                      //               ],
                                      //             )
                                      //           else
                                      //             Text(
                                      //               'No Sub Owners',
                                      //               style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                                      //             ),
                                      //         ],
                                      //       ),
                                      //     );
                                      //   },
                                      // ),
                                      child: ListView.separated(
                                        itemCount: garagesList.length,
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
                                          var garage = garagesList[index];
                                          var subOwnersList =
                                              garage.subOwner ?? [];
                                          var driver =
                                              garage.driver?.isNotEmpty == true
                                                  ? garage.driver![0]
                                                  : null;

                                          return Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: VColors.greyScale50,
                                              border: Border.all(
                                                color: VColors.greyScale300,
                                                width: 1.w,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18.r),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: VDeviceUtils
                                                              .getScreenWidth(
                                                                  context) /
                                                          1.65,
                                                      child: Text(
                                                        '${AppLocalizations.of(context)!.translate('garageName')}: ${garage.gragename ?? 'N/A'}',
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: VColors
                                                              .primaryColor500,
                                                        ),
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _showEditDialog(
                                                          context,
                                                          garage,
                                                          allGaragesCubit,
                                                        );
                                                      },
                                                      child: Icon(
                                                          Iconsax.edit_copy,
                                                          color: VColors
                                                              .primaryColor500),
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    GestureDetector(
                                                      onTap: () {
                                                        allGaragesCubit
                                                            .deleteSpecificGarageFunction(
                                                          garageId:
                                                              garage.garageId!,
                                                        );
                                                      },
                                                      child: Icon(
                                                          Iconsax
                                                              .profile_delete_copy,
                                                          color: VColors.error),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('garageLat')}: ${garage.lat ?? 'N/A'}',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('garagePricePerHour')}: ${garage.gragePricePerHoure ?? 'N/A'}',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                                SizedBox(height: 10.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('garageLng')}: ${garage.lng ?? 'N/A'}',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('openTime')}: ${garage.openDate ?? 'N/A'}',
                                                  // 'Garage Lng: ${DateFormat.jm().format(DateTime.parse(garage.openDate!)) ?? 'N/A'}',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('endTime')}: ${garage.endDate ?? 'N/A'}',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10.h),

                                                // Display driver's name if available
                                                if (driver != null)
                                                  Text(
                                                    '${AppLocalizations.of(context)!.translate('driverEmail')}: ${driver.email ?? 'N/A'}',
                                                    style: TextStyle(
                                                        fontSize: 14.sp),
                                                  )
                                                else
                                                  Text(
                                                    'No Driver Assigned',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.red),
                                                  ),
                                                SizedBox(height: 10.h),

                                                // Display list of sub-owners
                                                if (subOwnersList.isNotEmpty)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${AppLocalizations.of(context)!.translate('subOwners')}:',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      ...subOwnersList.map(
                                                          (subOwner) => Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            4.h),
                                                                child: Text(
                                                                  '- ${subOwner.email ?? 'N/A'}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp),
                                                                ),
                                                              )),
                                                    ],
                                                  )
                                                else
                                                  Text(
                                                    'No Sub Owners',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.grey),
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

  String formatTime(String? dateString) {
    if (dateString == null) {
      return 'N/A';
    }

    try {
      // Parse the date string to DateTime
      DateTime dateTime = DateTime.parse(dateString);

      // Format to 'h:mm a'
      String formattedTime = DateFormat('h:mm a').format(dateTime);
      return formattedTime;
    } catch (e) {
      return 'N/A'; // Return a default value in case of error
    }
  }

  // void _showEditDialog(BuildContext context, GarageDetails garage,
  //     HomeCubit allGaragesCubit,) {
  //   final TextEditingController nameController =
  //   TextEditingController(text: garage.gragename);
  //   final TextEditingController latController =
  //   TextEditingController(text: '${garage.lat}, ${garage.lng}');
  //   final TextEditingController lngController =
  //   TextEditingController(text: garage.lng?.toString());
  //   final TextEditingController openDateController =
  //   TextEditingController(text: garage.openDate);
  //   final TextEditingController endDateController =
  //   TextEditingController(text: garage.endDate);
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: Text('Edit Garage',
  //             style: VStyles.bodyLargeMedium.copyWith(fontSize: 22.sp)),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: nameController,
  //               decoration: InputDecoration(
  //                   labelText: 'Garage Name',
  //                   labelStyle: VStyles.bodyLargeRegular),
  //               style: VStyles.bodyLargeMedium,
  //             ),
  //             TextField(
  //               readOnly: true,
  //               controller: latController,
  //               decoration: InputDecoration(
  //                   labelText: 'Latitude & Longitude',
  //                   labelStyle: VStyles.bodyLargeRegular),
  //               style: VStyles.bodyLargeMedium,
  //             ),
  //             SizedBox(height: 10.h),
  //             // Button to open map and choose location
  //             TextButton.icon(
  //               icon: Icon(Icons.map, color: VColors.primaryColor500),
  //               label: Text(
  //                 'Choose Location on Map',
  //                 style: TextStyle(color: VColors.primaryColor500),
  //               ),
  //               onPressed: () async {
  //                 // Navigate to the MapScreen and wait for selected location
  //                 final selectedLocation = await Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) =>
  //                         MapScreen(
  //                           initialLat: double.tryParse(latController.text) ??
  //                               0.0,
  //                           initialLng: double.tryParse(lngController.text) ??
  //                               0.0,
  //                         ),
  //                   ),
  //                 );
  //
  //                 if (selectedLocation != null) {
  //                   // Update the latitude and longitude fields
  //                   latController.text = selectedLocation['lat'].toString();
  //                   lngController.text = selectedLocation['lng'].toString();
  //                 }
  //               },
  //             ),
  //             TextField(
  //               controller: openDateController,
  //               decoration: InputDecoration(
  //                   labelText: 'Open Date',
  //                   labelStyle: VStyles.bodyLargeRegular),
  //               style: VStyles.bodyLargeMedium,
  //             ),
  //             TextField(
  //               controller: endDateController,
  //               decoration: InputDecoration(
  //                   labelText: 'End Date',
  //                   labelStyle: VStyles.bodyLargeRegular),
  //               style: VStyles.bodyLargeMedium,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Update'),
  //             onPressed: () async {
  //               // Update garage information
  //               await allGaragesCubit.updateGarageFunction(
  //                   garageId: garage.garageId!,
  //                   gragename: nameController.text,
  //                   lat: double.tryParse(latController.text)!,
  //                   lng: double.tryParse(lngController.text)!,
  //                   openDate: openDateController.text,
  //                   endDate: endDateController.text,
  //                   gragePricePerHoure
  //                   :
  //               );
  //               Navigator.of(context).pop(); // Close the dialog
  //               allGaragesCubit
  //                   .getAllGaragesFunction(); // Fetch updated data to rebuild the screen
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void _showEditDialog(
    BuildContext context,
    GarageDetails garage,
    HomeCubit allGaragesCubit,
  ) {
    final TextEditingController nameController =
        TextEditingController(text: garage.gragename);
    final TextEditingController latController =
        TextEditingController(text: '${garage.lat}, ${garage.lng}');
    final TextEditingController lngController =
        TextEditingController(text: garage.lng?.toString());
    final TextEditingController openDateController =
        TextEditingController(text: garage.openDate);
    final TextEditingController endDateController =
        TextEditingController(text: garage.endDate);
    final TextEditingController pricePerHourController =
        TextEditingController(text: garage.gragePricePerHoure?.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
              '${AppLocalizations.of(context)!.translate('editGarage')}',
              style:
                  VStyles.bodyLargeMedium(context).copyWith(fontSize: 22.sp)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.translate('garageName')}',
                    labelStyle: VStyles.bodyLargeRegular(context)),
                style: VStyles.bodyLargeMedium(context),
              ),
              TextField(
                readOnly: true,
                controller: latController,
                decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.translate('latitudeAndLongitude')}',
                    labelStyle: VStyles.bodyLargeRegular(context)),
                style: VStyles.bodyLargeMedium(context),
              ),
              SizedBox(height: 10.h),
              // Button to open map and choose location
              TextButton.icon(
                icon: Icon(Icons.map, color: VColors.primaryColor500),
                label: Text(
                  '${AppLocalizations.of(context)!.translate('chooseLocationOnMap')!}',
                  style: TextStyle(color: VColors.primaryColor500),
                ),
                onPressed: () async {
                  // Navigate to the MapScreen and wait for selected location
                  final selectedLocation = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        initialLat: double.tryParse(latController.text) ?? 0.0,
                        initialLng: double.tryParse(lngController.text) ?? 0.0,
                      ),
                    ),
                  );

                  if (selectedLocation != null) {
                    // Update the latitude and longitude fields
                    latController.text = selectedLocation['lat'].toString();
                    lngController.text = selectedLocation['lng'].toString();
                  }
                },
              ),
              TextField(
                controller: openDateController,
                decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.translate('openDate')!}',
                    labelStyle: VStyles.bodyLargeRegular(context)),
                style: VStyles.bodyLargeMedium(context),
              ),
              TextField(
                controller: endDateController,
                decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.translate('endDate')!}',
                    labelStyle: VStyles.bodyLargeRegular(context)),
                style: VStyles.bodyLargeMedium(context),
              ),
              TextField(
                controller: pricePerHourController,
                decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.translate('garagePricePerHour')!}',
                    labelStyle: VStyles.bodyLargeRegular(context)),
                style: VStyles.bodyLargeMedium(context),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child:
                  Text('${AppLocalizations.of(context)!.translate('cancel')!}'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:
                  Text('${AppLocalizations.of(context)!.translate('update')!}'),
              onPressed: () async {
                // Update garage information
                await allGaragesCubit.updateGarageFunction(
                  garageId: garage.garageId!,
                  gragename: nameController.text,
                  lat: double.tryParse(latController.text) ?? 0.0,
                  lng: double.tryParse(lngController.text) ?? 0.0,
                  openDate: openDateController.text,
                  endDate: endDateController.text,
                  gragePricePerHoure: int.parse(pricePerHourController.text),
                );
                Navigator.of(context).pop(); // Close the dialog
                allGaragesCubit
                    .getAllGaragesFunction(); // Fetch updated data to rebuild the screen
              },
            ),
          ],
        );
      },
    );
  }
}
