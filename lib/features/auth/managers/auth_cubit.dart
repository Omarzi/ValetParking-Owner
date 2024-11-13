import 'package:meta/meta.dart';
import 'package:valetparking_owner/utils/constants/api_constants.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';
import 'package:valetparking_owner/utils/dio/dio_helper.dart';

import '../models/owner_data_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  OwnerDataModel ownerDataModel = OwnerDataModel();

  Future<void> loginFunction({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response =
          await dioHelper.postData(endPoint: ApiConstants.loginUrl, body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        ownerDataModel = OwnerDataModel.fromJson(response.data);
        await VCacheHelper.putString(
          key: CacheKeys.userId,
          value: response.data['ownerData']['ownerId'],
        );
        await VCacheHelper.putString(
          key: CacheKeys.token,
          value: response.data['token'],
        );
        await VCacheHelper.putString(
          key: CacheKeys.role,
          value: response.data['ownerData']['email'],
        );
        await VCacheHelper.putString(
          key: CacheKeys.email,
          value: response.data['ownerData']['role'],
        );
        emit(LoginSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(LoginErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(LoginErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(LoginErrorState(message: error.toString()));
    }
  }
}
