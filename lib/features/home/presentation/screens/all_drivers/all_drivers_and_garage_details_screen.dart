import 'package:valetparking_owner/features/home/managers/home_cubit.dart';
import 'package:valetparking_owner/features/home/models/drivers/get_all_drivers_and_garage_details_model.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_places/map_screen.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:intl/intl.dart';

class AllDriversAndGarageDetailsScreen extends StatefulWidget {
  const AllDriversAndGarageDetailsScreen({super.key});

  @override
  State<AllDriversAndGarageDetailsScreen> createState() =>
      _AllDriversAndGarageDetailsScreenState();
}

class _AllDriversAndGarageDetailsScreenState
    extends State<AllDriversAndGarageDetailsScreen> {
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
                  '${AppLocalizations.of(context)!.translate('allDrivers')}',
                  style: VStyles.h4Bold(context),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => context.pushNamed(VRoutesName.addNewDriverRoute, arguments: 'driver'),
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Icon(Iconsax.add_circle_copy, color: VColors.primaryColor500),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.pushNamed(VRoutesName.choiceAttendanceRoute),
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Icon(Icons.report_gmailerrorred, color: VColors.primaryColor500),
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
              HomeCubit.get(context).getAllDriversAndGarageDetailsFunction();
            }
          },
          builder: (context, state) {
            var getAllDriversCubit = HomeCubit.get(context);
            var driversList =
                getAllDriversCubit.getAllDriversAndGrarageDetailsModel.data;

            return driversList == null
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
                : driversList == [] || driversList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 32.w,
                            left: 32.w,
                            bottom: 48.h,
                          ),
                          child: getAllDriversCubit
                                      .getAllDriversAndGrarageDetailsModel
                                      .data ==
                                  null
                              ? LoadingWidget(
                                  iconColor: VColors.primaryColor500)
                              : Column(
                                  children: [
                                    /// Make Space
                                    SizedBox(height: 24.h),

                                    Container(
                                      width: double.infinity,
                                      height: VDeviceUtils.getScreenHeight(
                                              context) /
                                          1.2,
                                      // color: Colors.red,
                                      child: ListView.separated(
                                        itemCount: driversList.length,
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
                                          var driver = driversList[index];
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Display driver's salary
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: VDeviceUtils.getScreenWidth(context) / 1.65,
                                                      child: Text(
                                                        '${AppLocalizations.of(context)!.translate('driverEmail')}: ${driver.email.toString()}',
                                                        style: VStyles.h6Bold(context).copyWith(color: VColors.primaryColor500),
                                                        overflow: TextOverflow.clip,
                                                      ),
                                                    ),

                                                    GestureDetector(
                                                      onTap: () {
                                                        _showEditDriverDialog(context, driver, getAllDriversCubit);
                                                      },
                                                      child: Icon(
                                                        Iconsax.edit_copy,
                                                        color: VColors.primaryColor500,
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w),


                                                    GestureDetector(
                                                      onTap: () {
                                                        getAllDriversCubit.deleteSpecificDriverFunction(driverId: driversList[index].adminId!);
                                                      },
                                                      child: const Icon(Iconsax.profile_delete_copy, color: Colors.red),
                                                    ),
                                                  ],
                                                ),
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
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${AppLocalizations.of(context)!.translate('salary')}: ${driver.salary.toString()} kwd',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                                                ),
                                                                Text(
                                                                    '${AppLocalizations.of(context)!.translate('garageName')}: ${garage.gragename}',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                                                ),
                                                                Text(
                                                                    '${AppLocalizations.of(context)!.translate('garageDescription')}: ${garage.grageDescription}',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                                                ),
                                                                Text(
                                                                    '${AppLocalizations.of(context)!.translate('garagePricePerHour')}: ${garage.gragePricePerHoure}',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                                                ),
                                                                Text(
                                                                    '${AppLocalizations.of(context)!.translate('active')}: ${garage.active == true ? "Yes" : "No"}',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                                                ),
                                                                Text(
                                                                  '${AppLocalizations.of(context)!.translate('startDate')}: ${garage.openDate != null ? DateFormat.jm().format(DateTime.parse(garage.openDate!)) : 'N/A'}',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),

                                                                ),
                                                                Text(
                                                                  '${AppLocalizations.of(context)!.translate('endDate')}: ${garage.endDate} ${garage.openDate != null ? DateFormat.jm().format(DateTime.parse(garage.endDate!)) : 'N/A'}',
                                                                  style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }).toList(),
                                                      )
                                                    : Text(AppLocalizations.of(context)!.translate('noGaragesAvailable')!,
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

  void _showEditDriverDialog(
      BuildContext context, Data driver, HomeCubit allDriversCubit) {
    final TextEditingController emailController =
    TextEditingController(text: driver.email);
    final TextEditingController salaryController =
    TextEditingController(text: driver.salary?.toString());
    final TextEditingController roleController =
    TextEditingController(text: driver.role);
    final TextEditingController latController =
    TextEditingController(text: driver.lat?.toString());
    final TextEditingController lngController =
    TextEditingController(text: driver.lng?.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${AppLocalizations.of(context)!.translate('editDriver')}',
              style: VStyles.bodyLargeMedium(context).copyWith(fontSize: 22.sp)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('email'),
                      labelStyle: VStyles.bodyLargeRegular(context)),
                  style: VStyles.bodyLargeMedium(context),
                ),
                TextField(
                  controller: salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('salary'),
                      labelStyle: VStyles.bodyLargeRegular(context)),
                  style: VStyles.bodyLargeMedium(context),
                ),
                // TextField(
                //   controller: roleController,
                //   decoration: InputDecoration(
                //       labelText: 'Role',
                //       labelStyle: VStyles.bodyLargeRegular),
                //   style: VStyles.bodyLargeMedium,
                // ),
                TextField(
                  readOnly: true,
                  controller: latController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('latitude'),
                      labelStyle: VStyles.bodyLargeRegular(context)),
                  style: VStyles.bodyLargeMedium(context),
                ),
                TextField(
                  readOnly: true,
                  controller: lngController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('longitude'),
                      labelStyle: VStyles.bodyLargeRegular(context)),
                  style: VStyles.bodyLargeMedium(context),
                ),
                SizedBox(height: 10.h),
                // Button to open map and choose location
                TextButton.icon(
                  icon: Icon(Icons.map, color: VColors.primaryColor500),
                  label: Text(
                    AppLocalizations.of(context)!.translate('selectLocationOnMap')!,
                    style: TextStyle(color: VColors.primaryColor500),
                  ),
                  onPressed: () async {
                    // Navigate to the MapScreen and wait for the selected location
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
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.translate('cancel')!),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.translate('update')!),
              onPressed: () async {
                // Update driver information
                await allDriversCubit.updateSpecificDriverFunction(
                  driverId: driver.adminId,
                  email: emailController.text,
                  salary: double.tryParse(salaryController.text),
                  role: roleController.text,
                  lat: double.tryParse(latController.text),
                  lng: double.tryParse(lngController.text),
                );
                Navigator.of(context).pop(); // Close the dialog
                allDriversCubit.getAllDriversAndGarageDetailsFunction();

              },
            ),
          ],
        );
      },
    );
  }

}
