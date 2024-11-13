import 'package:flutter/material.dart';
import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_places/garages/garage_map_screen.dart';
import 'package:valetparking_owner/features/home/models/garages/get_all_garages_model.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddNewGarageScreen extends StatefulWidget {
  const AddNewGarageScreen({super.key});

  @override
  State<AddNewGarageScreen> createState() => _AddNewGarageScreenState();
}

class _AddNewGarageScreenState extends State<AddNewGarageScreen> {
  // Controllers for inputs
  TextEditingController garageNameController = TextEditingController();
  TextEditingController garageDescriptionController = TextEditingController();
  TextEditingController garagePricePerHourController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  // Focus nodes
  final FocusNode garageNameFocusNode = FocusNode();
  final FocusNode garageDescriptionFocusNode = FocusNode();
  final FocusNode garagePricePerHourFocusNode = FocusNode();
  final FocusNode latitudeFocusNode = FocusNode();
  final FocusNode longitudeFocusNode = FocusNode();

  // Dropdown variables
  String? selectedSpaceOption;
  final List<String> spaceOptions = ['Have Space', 'No Space'];
  File? _garageImage;

  // Maps variables
  LatLng? selectedLocation;
  String _selectedPeriod = 'AM'; // Default value
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String selectedEmail = 'Click here... to choose specific drivers ---';
  String selectedSubOwners =
      'Click here... to choose specific sub-owner ---'; // Declare the list for selected sub-owners
  List<SubOwner> subOwnerList = [];

  Future<void> _selectGarageImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _garageImage = File(image.path); // Convert XFile to File
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: VColors.whiteColor,
              title: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  "${AppLocalizations.of(context)!.translate('addNewGarage')}",
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
            if (state is AddNewGarageSuccessState) {
              FloatingSnackBar.show(
                context: context,
                message: '${AppLocalizations.of(context)!.translate('addedSuccessfully')}',
                textColor: Colors.white,
                duration: const Duration(milliseconds: 4000),
                backgroundColor: VColors.success,
              );
              context.pushNamedAndRemoveUntil(VRoutesName.homeRoute,
                  predicate: (route) => false);
            } else if (state is AddNewGarageErrorState) {
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
            var allDataCubit = HomeCubit.get(context);
            var driversList =
                allDataCubit.getAllDriversAndGrarageDetailsModel.data;
            var subOwnersList = allDataCubit.getAllSubOwnerDataModel.data;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  right: 32.w,
                  left: 32.w,
                  bottom: 48.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),

                    // Garage Name Field
                    TextFormFieldWidget(
                      controller: garageNameController,
                      textInputType: TextInputType.text,
                      focusNode: garageNameFocusNode,
                      hintText: '${AppLocalizations.of(context)!.translate('garageName')}',
                      hintColor: VColors.greyScale500,
                      prefixIcon: const Icon(Icons.local_parking),
                      fillColor: VColors.greyScale50,
                      borderSide: BorderSide.none,
                      obscureText: false,
                    ),

                    SizedBox(height: 24.h),

                    // Garage Description Field
                    TextFormFieldWidget(
                      controller: garageDescriptionController,
                      textInputType: TextInputType.text,
                      focusNode: garageDescriptionFocusNode,
                      hintText: '${AppLocalizations.of(context)!.translate('garageDescription')}',
                      hintColor: VColors.greyScale500,
                      prefixIcon: const Icon(Icons.description),
                      fillColor: VColors.greyScale50,
                      borderSide: BorderSide.none,
                      obscureText: false,
                    ),

                    SizedBox(height: 24.h),

                    // Garage Price Field
                    TextFormFieldWidget(
                      controller: garagePricePerHourController,
                      textInputType: TextInputType.number,
                      focusNode: garagePricePerHourFocusNode,
                      hintText: '${AppLocalizations.of(context)!.translate('garagePricePerHour')}',
                      hintColor: VColors.greyScale500,
                      prefixIcon: const Icon(Icons.money),
                      fillColor: VColors.greyScale50,
                      borderSide: BorderSide.none,
                      obscureText: false,
                    ),

                    SizedBox(height: 24.h),

                    /// Lat and Lng Buttons
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: latitudeController,
                            textInputType: TextInputType.text,
                            focusNode: latitudeFocusNode,
                            hintText: '${AppLocalizations.of(context)!.translate('garageLat')}',
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
                            hintText: '${AppLocalizations.of(context)!.translate('garageLng')}',
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
                        '${AppLocalizations.of(context)!.translate('selectLocationOnMap')}',
                        style: VStyles.bodyLargeBold(context)
                            .copyWith(color: VColors.primaryColor500),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    /// Make Select Specific Date PM or AM
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TimeSelectionWidget(
                          // openTime: const TimeOfDay(hour: 9, minute: 0),
                          // 9:00 AM
                          // endTime: const TimeOfDay(hour: 21, minute: 0),
                          // 9:00 PM
                          isStart: true,
                          onTimeSelected: (selectedTime) {
                            setState(() {
                              _startTime = selectedTime; // Capture start time
                            });
                          },
                        ),
                        TimeSelectionWidget(
                          // openTime: const TimeOfDay(hour: 9, minute: 0),
                          // 9:00 AM
                          // endTime: const TimeOfDay(hour: 21, minute: 0),
                          // 9:00 PM
                          isStart: false,
                          onTimeSelected: (selectedTime) {
                            setState(() {
                              _endTime = selectedTime; // Capture end time
                            });
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    DropdownButtonFormField<String>(
                      value: selectedSpaceOption,
                      hint: Text('${AppLocalizations.of(context)!.translate('haveSpaceOrNot')}',
                          style: VStyles.bodyLargeSemiBold(context)),
                      style: VStyles.bodyLargeSemiBold(context),
                      decoration: InputDecoration(
                        fillColor: VColors.greyScale50,
                        filled: true,
                      ),
                      items: spaceOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSpaceOption = value;
                        });
                      },
                      dropdownColor: Colors.white,
                    ),

                    SizedBox(height: 24.h),

                    /// Driver
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
                    //                   'Choose a driver',
                    //                   style: VStyles.h6Bold.copyWith(
                    //                     color: VColors.primaryColor500,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 16.h),
                    //                 driversList == null
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
                    //                     : driversList == [] ||
                    //                             driversList.isEmpty
                    //                         ? const Center(
                    //                             child:
                    //                                 CircularProgressIndicator())
                    //                         : SizedBox(
                    //                             height: 200
                    //                                 .h, // Set height for ListView
                    //                             child: Scrollbar(
                    //                               thumbVisibility: true,
                    //                               // This shows the scrollbar thumb always
                    //                               child: ListView.builder(
                    //                                 shrinkWrap: true,
                    //                                 itemCount:
                    //                                     driversList.length,
                    //                                 itemBuilder:
                    //                                     (context, index) {
                    //                                   return driversList[index]
                    //                                           .garage!
                    //                                           .isEmpty
                    //                                       ? ListTile(
                    //                                           title: Text(
                    //                                             driversList[index]
                    //                                                     .email ??
                    //                                                 'No email available',
                    //                                             style: VStyles
                    //                                                 .bodyXLargeSemiBold,
                    //                                           ),
                    //                                           onTap: () {
                    //                                             setState(() {
                    //                                               selectedEmail =
                    //                                                   driversList[index]
                    //                                                           .email ??
                    //                                                       'No email available';
                    //                                               VCacheHelper.putString(
                    //                                                   key: CacheKeys
                    //                                                       .adminId,
                    //                                                   value: driversList[
                    //                                                           index]
                    //                                                       .adminId!);
                    //                                             });
                    //                                             Navigator.of(
                    //                                                     context)
                    //                                                 .pop();
                    //                                             print(
                    //                                                 'Selected: ${driversList[index]}');
                    //                                           },
                    //                                         )
                    //                                       : Center(
                    //                                     child: Text(
                    //                                       'There is have no drivers empty.',
                    //                                       style: VStyles.bodyMediumRegular,
                    //                                     ),
                    //                                   );
                    //                                 },
                    //                               ),
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
                    //       borderRadius: BorderRadius.circular(12.r),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Icon(Iconsax.personalcard_copy, size: 27.sp),
                    //         SizedBox(width: 12.w),
                    //         Text(
                    //           selectedEmail,
                    //           style: VStyles.bodyMediumRegular,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(height: 24.h),

                    /// Sub Owners
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
                    //                   'Choose Sub-Owners',
                    //                   style: VStyles.h6Bold.copyWith(
                    //                     color: VColors.primaryColor500,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 16.h),
                    //                 subOwnersList == null
                    //                     ? Center(
                    //                         child: Column(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.center,
                    //                           children: [
                    //                             Text(
                    //                               'Have a problem in getting saved items',
                    //                               style: VStyles.h6Bold,
                    //                               textAlign: TextAlign.center,
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       )
                    //                     : subOwnersList.isEmpty
                    //                         ? const Center(
                    //                             child:
                    //                                 CircularProgressIndicator())
                    //                         : SizedBox(
                    //                             height: 200
                    //                                 .h, // Set height for ListView
                    //                             child: Scrollbar(
                    //                               thumbVisibility: true,
                    //                               child: ListView.builder(
                    //                                 shrinkWrap: true,
                    //                                 itemCount:
                    //                                     subOwnersList.length,
                    //                                 itemBuilder:
                    //                                     (context, index) {
                    //                                   return CheckboxListTile(
                    //                                     title: Text(
                    //                                       subOwnersList[index]
                    //                                               .email ??
                    //                                           'No email available',
                    //                                       style: VStyles
                    //                                           .bodyXLargeSemiBold,
                    //                                     ),
                    //                                     value: selectedSubOwners
                    //                                         .contains(
                    //                                             subOwnersList[
                    //                                                     index]
                    //                                                 .adminId),
                    //                                     onChanged:
                    //                                         (bool? selected) {
                    //                                       setState(() {
                    //                                         if (selected ==
                    //                                             true) {
                    //                                           selectedSubOwners.add(
                    //                                               subOwnersList[
                    //                                                       index]
                    //                                                   .adminId!); // Add the new selection
                    //                                         } else {
                    //                                           selectedSubOwners.remove(
                    //                                               subOwnersList[
                    //                                                       index]
                    //                                                   .adminId!); // Remove the selection if unchecked
                    //                                         }
                    //                                       });
                    //                                     },
                    //                                     secondary: selectedSubOwners
                    //                                             .contains(
                    //                                                 subOwnersList[
                    //                                                         index]
                    //                                                     .adminId)
                    //                                         ? Icon(
                    //                                             Icons
                    //                                                 .check_circle,
                    //                                             color: VColors
                    //                                                 .primaryColor500) // Icon when checked
                    //                                         : const Icon(Icons
                    //                                             .circle_outlined),
                    //                                   );
                    //                                 },
                    //                               ),
                    //                             ),
                    //                           ),
                    //                 SizedBox(height: 16.h),
                    //                 ElevatedButton(
                    //                   onPressed: () {
                    //                     // Save selected sub-owners to cache or perform any action
                    //                     VCacheHelper.putStringList(
                    //                         key: CacheKeys.selectedSubOwners,
                    //                         value: selectedSubOwners);
                    //                     Navigator.of(context).pop();
                    //                   },
                    //                   child: const Text("Confirm Selection"),
                    //                 ),
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
                    //       borderRadius: BorderRadius.circular(12.r),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Icon(Iconsax.personalcard_copy, size: 27.sp),
                    //         SizedBox(width: 12.w),
                    //         Text(
                    //           "Select Sub-Owners",
                    //           style: VStyles.bodyMediumRegular,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                    //                   'Choose a Sub-owner',
                    //                   style: VStyles.h6Bold.copyWith(
                    //                     color: VColors.primaryColor500,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 16.h),
                    //                 subOwnersList == null
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
                    //                     : subOwnersList == [] ||
                    //                             subOwnersList.isEmpty
                    //                         ? const Center(
                    //                             child:
                    //                                 CircularProgressIndicator())
                    //                         : SizedBox(
                    //                             height: 200
                    //                                 .h, // Set height for ListView
                    //                             child: Scrollbar(
                    //                               thumbVisibility: true,
                    //                               // This shows the scrollbar thumb always
                    //                               child: ListView.builder(
                    //                                 shrinkWrap: true,
                    //                                 itemCount:
                    //                                     subOwnersList.length,
                    //                                 itemBuilder:
                    //                                     (context, index) {
                    //                                   return subOwnersList[
                    //                                               index]
                    //                                           .garage!
                    //                                           .isEmpty
                    //                                       ? ListTile(
                    //                                           title: Text(
                    //                                             subOwnersList[
                    //                                                         index]
                    //                                                     .email ??
                    //                                                 'No email available',
                    //                                             style: VStyles
                    //                                                 .bodyXLargeSemiBold,
                    //                                           ),
                    //                                           onTap: () {
                    //                                             setState(() {
                    //                                               selectedSubOwners =
                    //                                                   subOwnersList[index]
                    //                                                           .email ??
                    //                                                       'No email available';
                    //                                               VCacheHelper.putString(
                    //                                                   key: CacheKeys
                    //                                                       .subOwnerId,
                    //                                                   value: subOwnersList[
                    //                                                           index]
                    //                                                       .adminId!);
                    //                                             });
                    //                                             Navigator.of(
                    //                                                     context)
                    //                                                 .pop();
                    //                                             print(
                    //                                                 'Selected: ${subOwnersList[index]}');
                    //                                           },
                    //                                         )
                    //                                       : Center(
                    //                                     child: Text(
                    //                                       'There is have no sub owners empty.',
                    //                                       style: VStyles.bodyMediumRegular,
                    //                                     ),
                    //                                   );
                    //                                 },
                    //                               ),
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
                    //       borderRadius: BorderRadius.circular(12.r),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Icon(Iconsax.personalcard_copy, size: 27.sp),
                    //         SizedBox(width: 12.w),
                    //         Text(
                    //           selectedSubOwners,
                    //           style: VStyles.bodyMediumRegular,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // if (selectedSubOwners.isNotEmpty)
                    //   Row(
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.only(top: 8.h),
                    //         child: Text(
                    //           selectedSubOwners
                    //               .map((id) => subOwnersList
                    //                   ?.firstWhere(
                    //                       (subOwner) => subOwner.adminId == id)
                    //                   .email)
                    //               .join("\n"),
                    //           style: VStyles.bodyMediumRegular
                    //               .copyWith(color: VColors.primaryColor500),
                    //         ),
                    //       ),
                    //     ],
                    //   ),

                    SizedBox(height: 24.h),

                    /// Select garage image
                    GestureDetector(
                      onTap: _selectGarageImage, // Call the function on tap
                      child: DottedBorder(
                        dashPattern: [6, 3, 2, 3],
                        strokeWidth: 2,
                        color: VColors.greyScale400,
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        radius: Radius.circular(8.r),
                        borderType: BorderType.Rect,
                        child: _garageImage == null
                            ? Center(
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('selectGarageImage')}',
                                  style: VStyles.h6Bold(context)
                                      .copyWith(color: VColors.primaryColor500),
                                ),
                              ) // Placeholder text
                            : Container(
                                width: double.infinity,
                                height:
                                    VDeviceUtils.getScreenHeight(context) / 8,
                                child: Image.file(File(_garageImage!.path),
                                    fit: BoxFit.cover),
                              ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    MainButtonWidget(
                      centerWidgetInButton: state is AddNewGarageLoadingState
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
                        List<String>? selectedSubOwners = await VCacheHelper.getStringList(
                          key: CacheKeys.selectedSubOwners,
                        );
                        String? selectedDriver = VCacheHelper.getString(key: CacheKeys.adminId);

                        // Remove empty strings from the lists
                        selectedSubOwners = selectedSubOwners?.where((id) => id.isNotEmpty).toList();
                        List<String>? drivers = selectedDriver != null && selectedDriver.isNotEmpty ? [selectedDriver] : null;

                        // Pass `null` if the list is empty after filtering
                        if (_startTime != null && _endTime != null && _garageImage != null) {
                          allDataCubit.addNewGarageFunction(
                            gragename: garageNameController.text,
                            grageDescription: garageDescriptionController.text,
                            garageImages: [_garageImage!.path],
                            gragePricePerHoure: double.parse(garagePricePerHourController.text),
                            lat: double.parse(latitudeController.text),
                            lng: double.parse(longitudeController.text),
                            openDate: _startTime!.format(context),
                            endDate: _endTime!.format(context),
                            active: selectedSpaceOption == 'Have Space',
                            driver: drivers?.isNotEmpty == true ? drivers : null,  // Only pass if not empty
                            subOwners: selectedSubOwners?.isNotEmpty == true ? selectedSubOwners : null,  // Only pass if not empty
                          );
                        } else {
                          print('Please select both start and end times, and an image.');
                        }

                        // logSuccess(garageNameController.text);
                        // logSuccess(garageDescriptionController.text);
                        // logSuccess(double.parse(garagePricePerHourController.text).toString());
                        // logSuccess(double.parse(latitudeController.text).toString());
                        // logSuccess(double.parse(longitudeController.text).toString());
                        // logSuccess( _startTime!.format(context));
                        // logSuccess( _endTime!.format(context));
                        // logSuccess( selectedSpaceOption == 'Have Space' ? 'true' : 'false');
                        // logSuccess( drivers?.isNotEmpty == true ? drivers : null);
                        // logSuccess(selectedSubOwners?.isNotEmpty == true ? selectedSubOwners : null);

                        // List<String>? selectedSubOwners =
                        //     await VCacheHelper.getStringList(
                        //         key: CacheKeys.selectedSubOwners);
                        //
                        // if (_startTime != null &&
                        //     _endTime != null &&
                        //     _garageImage != null) {
                        //   allDataCubit.addNewGarageFunction(
                        //     gragename: garageNameController.text,
                        //     grageDescription: garageDescriptionController.text,
                        //
                        //     // Convert the image path to a File and wrap it in a list
                        //     garageImages: [_garageImage!.path],
                        //
                        //     gragePricePerHoure:
                        //         double.parse(garagePricePerHourController.text),
                        //     lat: double.parse(latitudeController.text),
                        //     lng: double.parse(longitudeController.text),
                        //     openDate: _startTime!.format(context),
                        //     endDate: _endTime!.format(context),
                        //     active: selectedSpaceOption == 'Have Space'
                        //         ? true
                        //         : false,
                        //
                        //     // driver: [
                        //     //   VCacheHelper.getString(key: CacheKeys.adminId)!
                        //     // ],
                        //     // subOwners: [
                        //     //   VCacheHelper.getString(key: CacheKeys.subOwnerId)!
                        //     // ],
                        //   );
                        // } else {
                        //   print(
                        //       'Please select both start and end times, and an image.');
                        // }
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

// class TimeSelectionWidget extends StatefulWidget {
//   final TimeOfDay openTime;
//   final TimeOfDay endTime;
//   final bool isStart;
//   final ValueChanged<TimeOfDay?>
//       onTimeSelected; // Callback to pass the selected time
//
//   const TimeSelectionWidget({
//     Key? key,
//     required this.openTime,
//     required this.endTime,
//     required this.isStart,
//     required this.onTimeSelected, // Accept callback
//   }) : super(key: key);
//
//   @override
//   _TimeSelectionWidgetState createState() => _TimeSelectionWidgetState();
// }
//
// class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
//   TimeOfDay? _selectedTime;
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: widget.openTime,
//     );
//
//     if (picked != null) {
//       if (picked.hour >= widget.openTime.hour &&
//           picked.hour <= widget.endTime.hour) {
//         setState(() {
//           _selectedTime = picked;
//         });
//         widget
//             .onTimeSelected(_selectedTime); // Send selected time back to parent
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 'Please select a time between ${widget.openTime.format(context)} and ${widget.endTime.format(context)}'),
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Select Time in ${widget.isStart == true ? 'Start' : 'End'}",
//           style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8.h),
//         GestureDetector(
//           onTap: () {
//             _selectTime(context);
//           },
//           child: Container(
//             padding: EdgeInsets.all(16.w),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(8.w),
//             ),
//             child: Text(
//               _selectedTime != null
//                   ? _selectedTime!.format(context)
//                   : 'Select Time',
//               style: TextStyle(fontSize: 16.sp),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class TimeSelectionWidget extends StatefulWidget {
  final bool isStart;
  final ValueChanged<TimeOfDay?> onTimeSelected;

  const TimeSelectionWidget({
    Key? key,
    required this.isStart,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _TimeSelectionWidgetState createState() => _TimeSelectionWidgetState();
}

class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onTimeSelected(_selectedTime); // Send selected time back to parent
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Time for ${widget.isStart ? 'Start' : 'End'}",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () {
            _selectTime(context);
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Text(
              _selectedTime != null
                  ? _selectedTime!.format(context)
                  : '${AppLocalizations.of(context)!.translate('selectTime')}',
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:valetparking_owner/utils/constants/exports.dart';
//
// class AddNewGarageScreen extends StatefulWidget {
//   const AddNewGarageScreen({super.key});
//
//   @override
//   State<AddNewGarageScreen> createState() => _AddNewGarageScreenState();
// }
//
// class _AddNewGarageScreenState extends State<AddNewGarageScreen> {
//   TextEditingController garageNameController = TextEditingController();
//   TextEditingController garageDescriptionController = TextEditingController();
//   TextEditingController garagePricePerHourController = TextEditingController();
//
//   final FocusNode garageNameFocusNode = FocusNode();
//   final FocusNode garageDescriptionFocusNode = FocusNode();
//   final FocusNode garagePricePerHourFocusNode = FocusNode();
//
//   bool isGarageNameFieldFocused = false;
//   bool isGarageDescriptionFieldFocused = false;
//   bool isGaragePricePerHourFieldFocused = false;
//
//
//   @override
//   void initState() {
//     super.initState();
//     /// Add listener to focus node
//     garageNameFocusNode.addListener(
//             () => setState(() => isGarageNameFieldFocused = garageNameFocusNode.hasFocus));
//     garageDescriptionFocusNode.addListener(
//             () => setState(() => isGarageDescriptionFieldFocused = garageDescriptionFocusNode.hasFocus));
//     garagePricePerHourFocusNode.addListener(
//             () => setState(() => isGaragePricePerHourFieldFocused = garagePricePerHourFocusNode.hasFocus));
//   }
//
//   @override
//   void dispose() {
//     /// Clean up the focus node and controller when the widget is disposed.
//     garageNameFocusNode.dispose();
//     garageDescriptionFocusNode.dispose();
//     garagePricePerHourFocusNode.dispose();
//     garageNameController.dispose();
//     garageDescriptionController.dispose();
//     garagePricePerHourController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 elevation: 0,
//                 backgroundColor: VColors.whiteColor,
//                 title: Padding(
//                   padding: EdgeInsets.only(right: 24.w),
//                   child: Text(
//                     "Add new garage",
//                     style: VStyles.h4Bold,
//                   ),
//                 ),
//                 floating: true,
//                 pinned: true,
//                 flexibleSpace: Container(
//                   color: VColors.whiteColor,
//                 ),
//               ),
//             ];
//           },
//           body: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(
//                 right: 32.w,
//                 left: 32.w,
//                 bottom: 48.h,
//               ),
//               child: Column(
//                 children: [
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   TextFormFieldWidget(
//                     controller: garageNameController,
//                     textInputType: TextInputType.emailAddress,
//                     focusNode: garageNameFocusNode,
//                     hintText: 'Garage name',
//                     hintColor: isGarageNameFieldFocused
//                         ? VColors.primaryColor500
//                         : VColors.greyScale500,
//                     prefixIcon: SvgPicture.asset(VImages.email2Icon,
//                         fit: BoxFit.scaleDown,
//                         colorFilter: ColorFilter.mode(
//                             isGarageNameFieldFocused
//                                 ? VColors.primaryColor500
//                                 : garageNameController.text.isNotEmpty
//                                 ? VColors.greyScale900
//                                 : VColors.greyScale500,
//                             BlendMode.srcIn)),
//                     fillColor: isGarageNameFieldFocused
//                         ? VColors.purpleTransparent.withOpacity(.08)
//                         : VColors.greyScale50,
//                     borderSide: isGarageNameFieldFocused
//                         ? BorderSide(color: VColors.primaryColor500)
//                         : BorderSide.none,
//                     obscureText: false,
//                   ),
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   TextFormFieldWidget(
//                     controller: garageDescriptionController,
//                     textInputType: TextInputType.emailAddress,
//                     focusNode: garageDescriptionFocusNode,
//                     hintText: AppLocalizations.of(context)!.translate('email')!,
//                     hintColor: isGarageDescriptionFieldFocused
//                         ? VColors.primaryColor500
//                         : VColors.greyScale500,
//                     prefixIcon: SvgPicture.asset(VImages.email2Icon,
//                         fit: BoxFit.scaleDown,
//                         colorFilter: ColorFilter.mode(
//                             isGarageDescriptionFieldFocused
//                                 ? VColors.primaryColor500
//                                 : garageDescriptionController.text.isNotEmpty
//                                 ? VColors.greyScale900
//                                 : VColors.greyScale500,
//                             BlendMode.srcIn)),
//                     fillColor: isGarageDescriptionFieldFocused
//                         ? VColors.purpleTransparent.withOpacity(.08)
//                         : VColors.greyScale50,
//                     borderSide: isGarageDescriptionFieldFocused
//                         ? BorderSide(color: VColors.primaryColor500)
//                         : BorderSide.none,
//                     obscureText: false,
//                   ),
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   TextFormFieldWidget(
//                     controller: garagePricePerHourController,
//                     textInputType: TextInputType.emailAddress,
//                     focusNode: garagePricePerHourFocusNode,
//                     hintText: AppLocalizations.of(context)!.translate('email')!,
//                     hintColor: isGaragePricePerHourFieldFocused
//                         ? VColors.primaryColor500
//                         : VColors.greyScale500,
//                     prefixIcon: SvgPicture.asset(VImages.email2Icon,
//                         fit: BoxFit.scaleDown,
//                         colorFilter: ColorFilter.mode(
//                             isGaragePricePerHourFieldFocused
//                                 ? VColors.primaryColor500
//                                 : garagePricePerHourController.text.isNotEmpty
//                                 ? VColors.greyScale900
//                                 : VColors.greyScale500,
//                             BlendMode.srcIn)),
//                     fillColor: isGaragePricePerHourFieldFocused
//                         ? VColors.purpleTransparent.withOpacity(.08)
//                         : VColors.greyScale50,
//                     borderSide: isGaragePricePerHourFieldFocused
//                         ? BorderSide(color: VColors.primaryColor500)
//                         : BorderSide.none,
//                     obscureText: false,
//                   ),
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   /// Lat
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   /// Lng
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   /// Open Date
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   /// End Date
//
//                   /// Make Space
//                   SizedBox(height: 24.h),
//
//                   /// Have space or not
//
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
