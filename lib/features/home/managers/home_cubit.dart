import 'package:meta/meta.dart';
import 'package:valetparking_owner/features/home/models/drivers/get_all_drivers_and_garage_details_model.dart';
import 'package:valetparking_owner/features/home/models/drivers/get_attendance_in_start_model.dart';
import 'package:valetparking_owner/features/home/models/drivers/get_attendance_in_today_model.dart';
import 'package:valetparking_owner/features/home/models/garages/get_all_garages_model.dart';
import 'package:valetparking_owner/features/home/models/get_all_sub_owners_data_model.dart';
import 'package:valetparking_owner/features/home/models/get_all_users_data_model.dart';
import 'package:valetparking_owner/utils/constants/api_constants.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:valetparking_owner/utils/dio/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  GetAllGaragesModel getAllGaragesModel = GetAllGaragesModel();
  GetAttendanceInTodayModel getAttendanceInTodayModel = GetAttendanceInTodayModel();
  GetAttendanceInStartModel getAttendanceInStartModel = GetAttendanceInStartModel();

  GetAllDriversAndGrarageDetailsModel getAllDriversAndGrarageDetailsModel =
  GetAllDriversAndGrarageDetailsModel();

  GetAllSubOwnerDataModel getAllSubOwnerDataModel = GetAllSubOwnerDataModel();

  GetAllUserDataModel getAllUserDataModel = GetAllUserDataModel();

  Future<void> getAllDriversAndGarageDetailsFunction() async {
    emit(GetAllDriversAndGetGarageDetailsLoadingStates());

    try {
      final response = await dioHelper.getData(
        endPoint:
        '${ApiConstants.getAllDriversAndGarageDetailsUrl}?role=Driver',
      );

      if (response.statusCode == 200) {
        getAllDriversAndGrarageDetailsModel =
            GetAllDriversAndGrarageDetailsModel.fromJson(response.data);
        emit(GetAllDriversAndGetGarageDetailsSuccessStates(
            message: 'Get all drivers and garage details successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllDriversAndGetGarageDetailsErrorStates(
            message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllDriversAndGetGarageDetailsErrorStates(
          message: error.toString()));
    }
  }

  Future<void> getAllSubOwnersFunction() async {
    emit(GetAllSubOwnersLoadingStates());

    try {
      final response = await dioHelper.getData(
        endPoint:
        '${ApiConstants.getAllDriversAndGarageDetailsUrl}?role=SubOwner',
      );

      if (response.statusCode == 200) {
        getAllSubOwnerDataModel =
            GetAllSubOwnerDataModel.fromJson(response.data);
        emit(GetAllDriversAndGetGarageDetailsSuccessStates(
            message: 'Get all sub owners successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllSubOwnersErrorStates(
            message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllSubOwnersErrorStates(message: error.toString()));
    }
  }

  Future<void> getAllUsersFunction() async {
    emit(GetAllUsersLoadingStates());

    try {
      final response = await dioHelper.getData(
        endPoint: ApiConstants.getAllUsersUrl,
      );

      if (response.statusCode == 200) {
        getAllUserDataModel = GetAllUserDataModel.fromJson(response.data);
        emit(GetAllUsersSuccessStates(message: 'Get all users successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllUsersErrorStates(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllUsersErrorStates(message: error.toString()));
    }
  }

  Future<void> addWalletToSpecificUserFunction({
    required String userId,
    required double wallet,
  }) async {
    emit(AddWalletLoadingState());

    try {
      final response = await dioHelper
          .postData(endPoint: "${ApiConstants.addToWalletUrl}$userId", body: {
        'wallet': wallet,
      });

      if (response.statusCode == 200) {
        emit(AddWalletSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(AddWalletErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(AddWalletErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(AddWalletErrorState(message: error.toString()));
    }
  }

  // Future<void> addDriverFunction({
  //   required String email,
  //   required String password,
  //   required String role,
  //   required double lat,
  //   required double lng,
  //   required double salary,
  //   required List<String> garage,
  // }) async {
  //   emit(AddDriverLoadingState());
  //
  //   try {
  //     final response = await dioHelper
  //         .postData(endPoint: ApiConstants.addToDriverUrl, body: {
  //       "email": email,
  //       "password": password,
  //       "lat": lat,
  //       "lng": lng,
  //       "salary": salary,
  //       "garage": garage,
  //       // "role": "Driver"
  //       'role': role,
  //     });
  //
  //     if (response.statusCode == 200) {
  //       emit(AddDriverSuccessState(message: response.data['message']));
  //     } else if (response.statusCode == 422 || response.statusCode == 404) {
  //       logError(response.data['message'].toString());
  //       emit(AddDriverErrorState(message: response.data['message'] ?? ''));
  //     } else {
  //       logError(response.data['message'].toString());
  //       emit(AddDriverErrorState(message: 'Error in login'));
  //     }
  //   } catch (error) {
  //     logError(error.toString());
  //     emit(AddDriverErrorState(message: error.toString()));
  //   }
  // }
  Future<void> addDriverFunction({
    String? email,
    String? password,
    String? role,
    double? lat,
    double? lng,
    double? salary,
    List<String>? garage,
  }) async {
    emit(AddDriverLoadingState());

    try {
      // Prepare the request body with optional fields
      Map<String, dynamic> requestBody = {};

      if (email != null) requestBody['email'] = email;
      if (password != null) requestBody['password'] = password;
      if (lat != null) requestBody['lat'] = lat;
      if (lng != null) requestBody['lng'] = lng;
      if (salary != null) requestBody['salary'] = salary;
      if (garage != null) requestBody['garage'] = garage;
      if (role != null) requestBody['role'] = role;  // Assign role if provided

      final response = await dioHelper.postData(
        endPoint: ApiConstants.addToDriverUrl,
        body: requestBody,
      );

      if (response.statusCode == 200) {
        emit(AddDriverSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(AddDriverErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(AddDriverErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(AddDriverErrorState(message: error.toString()));
    }
  }



  Future<void> updateSpecificDriverFunction({
    required String? driverId,
    String? email,                  // Optional
    String? password,               // Optional
    String? role,                   // Optional
    double? lat,                    // Optional
    double? lng,                    // Optional
    double? salary,                 // Optional
    List<String>? garage,            // Optional
  }) async {
    emit(UpdateSpecificDriverLoadingState());

    try {
      final response = await dioHelper
          .putData(
          endPoint: "${ApiConstants.updateSpecificDriverUrl}$driverId", body: {
        if (email != null) 'email': email,
        if (password != null) 'password': password,
        if (role != null) 'role': role,
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
        if (salary != null) 'salary': salary,
        if (garage != null) 'garage': garage,
      });

      if (response.statusCode == 200) {
        emit(UpdateSpecificDriverSuccessStates(
            message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(UpdateSpecificDriverErrorStates(
            message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(UpdateSpecificDriverErrorStates(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(UpdateSpecificDriverErrorStates(message: error.toString()));
    }
  }


  /// Get All Garages Function
  Future<void> getAllGaragesFunction() async {
    emit(GetAllGaragesLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint: ApiConstants.getAllGaragesUrl,
      );

      if (response.statusCode == 200) {
        getAllGaragesModel = GetAllGaragesModel.fromJson(response.data);
        emit(
            GetAllGaragesSuccessState(message: 'Get all Garages successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllGaragesErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllGaragesErrorState(message: error.toString()));
    }
  }

  Future<void> updateGarageFunction({
    required String? garageId,
    String? gragename,                   // Optional
    String? grageDescription,            // Optional
    List<String>? garageImages,           // Optional
    int? gragePricePerHoure,
    double? lat,                          // Optional
    double? lng,                          // Optional
    String? openDate,                     // Optional
    String? endDate,                      // Optional
    bool? active,                         // Optional
    List<String>? driver,                 // Optional
    List<String>? subOwners,              // Optional
  }) async {
    emit(UpdateGarageLoadingState());

    try {
      // Create a map to hold data for the form
      Map<String, dynamic> data = {};

      // Add fields only if they are not null
      if (gragename != null) data['gragename'] = gragename;
      if (grageDescription != null) data['grageDescription'] = grageDescription;
      if (gragePricePerHoure != null) data['gragePricePerHoure'] = gragePricePerHoure;
      if (lat != null) data['lat'] = lat;
      if (lng != null) data['lng'] = lng;
      if (openDate != null) data['openDate'] = openDate;
      if (endDate != null) data['endDate'] = endDate;
      if (active != null) data['active'] = active;
      if (driver != null) data['driver'] = driver;
      if (subOwners != null) data['subOwner'] = subOwners;

      final response = await dioHelper.putData(
        endPoint: '${ApiConstants.updateGarageUrl}$garageId',
        body: data,
      );

      if (response.statusCode == 200) {
        emit(UpdateGarageSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(UpdateGarageErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(UpdateGarageErrorState(message: 'Error in updating garage'));
      }
    } catch (error) {
      logError(error.toString());
      emit(UpdateGarageErrorState(message: error.toString()));
    }
  }


  // Future<void> addNewGarageFunction({
  //   required String gragename,
  //   required String grageDescription,
  //   required File garageImages,
  //   required double gragePricePerHoure,
  //   required double lat,
  //   required double lng,
  //   required String openDate,
  //   required String endDate,
  //   required bool active,
  //   required String driver,
  //   required List<String> subOwners,
  // }) async {
  //   emit(AddNewGarageLoadingState());
  //
  //   try {
  //     FormData formData = FormData.fromMap({
  //       'gragename': gragename,
  //       'grageDescription': grageDescription,
  //       'gragePricePerHoure': gragePricePerHoure,
  //       'lat': lat,
  //       'lng': lng,
  //       'openDate': openDate,
  //       'endDate': endDate,
  //       'active': active,
  //       'driver': driver,
  //       'subOwner': subOwners,
  //       'garageImages': await MultipartFile.fromFile(garageImages.path,
  //           filename: garageImages.path.split('/').last),
  //     });
  //
  //     final response = await dioHelper.postFormData(
  //       endPoint: ApiConstants.addNewGarageUrl,
  //       formData: formData,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       emit(AddNewGarageSuccessState(message: response.data['message']));
  //     } else if (response.statusCode == 422 || response.statusCode == 404) {
  //       logError(response.data['message'].toString());
  //       emit(AddNewGarageErrorState(message: response.data['message'] ?? ''));
  //     } else {
  //       logError(response.data['message'].toString());
  //       emit(AddNewGarageErrorState(message: 'Error in adding garage'));
  //     }
  //   } catch (error) {
  //     logError(error.toString());
  //     emit(AddWalletErrorState(message: error.toString()));
  //   }
  // }


  Future<void> addNewGarageFunction({
    required String gragename,
    required String grageDescription,
    required List<String> garageImages,
    required double gragePricePerHoure,
    required double lat,
    required double lng,
    required String openDate,
    required String endDate,
    required bool active,
    List<String>? driver,  // Make driver optional
    List<String>? subOwners,  // Make subOwners optional
  }) async {
    emit(AddNewGarageLoadingState());

    try {
      Map<String, dynamic> data = {
        'gragename': gragename,
        'grageDescription': grageDescription,
        'gragePricePerHoure': gragePricePerHoure,
        'garageImages': garageImages,
        'lat': lat,
        'lng': lng,
        'openDate': openDate,
        'endDate': endDate,
        'active': active,
        // 'driver': driver?.isNotEmpty == true ? driver : null,  // Send null if driver is empty
        // 'subOwner': subOwners?.isNotEmpty == true ? subOwners : null,  // Send null if subOwners is empty
      };

      FormData formData = FormData.fromMap(data);

      final response = await dioHelper.postFormData(
        endPoint: ApiConstants.addNewGarageUrl,
        formData: formData,
      );

      if (response.statusCode == 200) {
        emit(AddNewGarageSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        logSuccess('error 422 or 404');
        emit(AddNewGarageErrorState(message: response.data['message'] ?? ''));
      } else {
        logSuccess('error  in else');
        logError(response.data['message'].toString());
        emit(AddNewGarageErrorState(message: response.data['message']));
      }
    } catch (error) {
      logSuccess('error  in catch');
      logError(error.toString());
      emit(AddWalletErrorState(message: error.toString()));
    }
  }

  // Future<void> addNewGarageFunction({
  //   required String gragename,
  //   required String grageDescription,
  //   // required List<File> garageImages, // Changed to List<File>
  //   required List<String> garageImages,
  //   required double gragePricePerHoure,
  //   required double lat,
  //   required double lng,
  //   required String openDate,
  //   required String endDate,
  //   required bool active,
  //   required List<String> driver,
  //   required List<String> subOwners,
  // }) async {
  //   emit(AddNewGarageLoadingState());
  //
  //   try {
  //     // Create a map for the form data
  //     Map<String, dynamic> data = {
  //       'gragename': gragename,
  //       'grageDescription': grageDescription,
  //       'gragePricePerHoure': gragePricePerHoure,
  //       'garageImages': garageImages,
  //       'lat': lat,
  //       'lng': lng,
  //       'openDate': openDate,
  //       'endDate': endDate,
  //       'active': active,
  //       'driver': driver,
  //       'subOwner': subOwners,
  //     };
  //
  //     // Prepare garageImages to be sent
  //     // List<MultipartFile> multipartFiles = [];
  //     // for (var image in garageImages) {
  //     //   multipartFiles.add(await MultipartFile.fromFile(
  //     //     image.path,
  //     //     filename: image.path.split('/').last,
  //     //   ));
  //     // }
  //     //
  //     // // Add the garageImages list to the form data
  //     // data['garageImages'] = multipartFiles;
  //
  //     FormData formData = FormData.fromMap(data);
  //
  //     final response = await dioHelper.postFormData(
  //       endPoint: ApiConstants.addNewGarageUrl,
  //       formData: formData,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       emit(AddNewGarageSuccessState(message: response.data['message']));
  //     } else if (response.statusCode == 422 || response.statusCode == 404) {
  //       logError(response.data['message'].toString());
  //       emit(AddNewGarageErrorState(message: response.data['message'] ?? ''));
  //     } else {
  //       logError(response.data['message'].toString());
  //       emit(AddNewGarageErrorState(message: 'Error in adding garage'));
  //     }
  //   } catch (error) {
  //     logError(error.toString());
  //     emit(AddWalletErrorState(message: error.toString()));
  //   }
  // }


  Future<void> deleteSpecificGarageFunction({required String garageId,}) async {
    emit(DeleteSpecificGarageLoadingState());

    try {
      final response = await dioHelper
          .deleteData(endPoint: "${ApiConstants.deleteSpecificGarageUrl}$garageId");

      if (response.statusCode == 200) {
        emit(DeleteSpecificGarageSuccessState(message: 'Deleted successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(DeleteSpecificGarageErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(DeleteSpecificGarageErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(DeleteSpecificGarageErrorState(message: error.toString()));
    }
  }


  Future<void> deleteSpecificDriverFunction({required String driverId,}) async {
    emit(DeleteSpecificDriverLoadingState());

    try {
      final response = await dioHelper
          .deleteData(endPoint: "${ApiConstants.deleteSpecificDriverUrl}$driverId");

      if (response.statusCode == 200) {
        emit(DeleteSpecificDriverSuccessState(message: 'Deleted successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(DeleteSpecificDriverErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(DeleteSpecificDriverErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(DeleteSpecificDriverErrorState(message: error.toString()));
    }
  }

  Future<void> getAllAttendancesInTodayFunction() async {
    emit(GetAllAttendancesInTodayLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint: ApiConstants.getAttendanceInTodayUrl,
      );

      if (response.statusCode == 200) {
        getAttendanceInTodayModel = GetAttendanceInTodayModel.fromJson(response.data);
        emit(
            GetAllAttendancesInTodaySuccessState(message: 'Get all attendances successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllAttendancesInTodayErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllAttendancesInTodayErrorState(message: error.toString()));
    }
  }

  Future<void> getAllAttendancesInStartFunction({required String createdAtGTE, required String createdAtLTE}) async {
    emit(GetAllAttendancesInStartLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint: '${ApiConstants.getAttendanceStartInUrl}?createdAt[gte]=$createdAtGTE&createdAt[lte]=$createdAtLTE',
      );

      if (response.statusCode == 200) {
        getAttendanceInStartModel = GetAttendanceInStartModel.fromJson(response.data);
        emit(
            GetAllAttendancesInStartSuccessState(message: 'Get all attendances in start successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllAttendancesInStartErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllAttendancesInStartErrorState(message: error.toString()));
    }
  }

  Future<void> getAllAttendancesInEndFunction({required String createdAtGTE, required String createdAtLTE}) async {
    emit(GetAllAttendancesInEndLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint: '${ApiConstants.getAttendanceEndInUrl}?createdAt[gte]=$createdAtGTE&createdAt[lte]=$createdAtLTE',
      );

      if (response.statusCode == 200) {
        getAttendanceInStartModel = GetAttendanceInStartModel.fromJson(response.data);
        emit(
            GetAllAttendancesInEndSuccessState(message: 'Get all attendances in start successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllAttendancesInStartErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllAttendancesInEndErrorState(message: error.toString()));
    }
  }


}
