part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

/// Get All Drivers And Get Garage Details States
class GetAllDriversAndGetGarageDetailsLoadingStates extends HomeState {}

class GetAllDriversAndGetGarageDetailsErrorStates extends HomeState {
  final String? message;

  GetAllDriversAndGetGarageDetailsErrorStates({this.message});
}

class GetAllDriversAndGetGarageDetailsSuccessStates extends HomeState {
  final String? message;

  GetAllDriversAndGetGarageDetailsSuccessStates({this.message});
}

class UpdateSpecificDriverLoadingState extends HomeState {}

class UpdateSpecificDriverSuccessStates extends HomeState {
  final String? message;

  UpdateSpecificDriverSuccessStates({this.message});
}

class UpdateSpecificDriverErrorStates extends HomeState {
  final String? message;

  UpdateSpecificDriverErrorStates({this.message});
}

/// Get All Sub Owners States
class GetAllSubOwnersLoadingStates extends HomeState {}

class GetAllSubOwnersErrorStates extends HomeState {
  final String? message;

  GetAllSubOwnersErrorStates({this.message});
}

class GetAllSubOwnersSuccessStates extends HomeState {
  final String? message;

  GetAllSubOwnersSuccessStates({this.message});
}

/// Get All Users States
class GetAllUsersLoadingStates extends HomeState {}

class GetAllUsersErrorStates extends HomeState {
  final String? message;

  GetAllUsersErrorStates({this.message});
}

class GetAllUsersSuccessStates extends HomeState {
  final String? message;

  GetAllUsersSuccessStates({this.message});
}

/// Add Wallet States
class AddWalletLoadingState extends HomeState {}

class AddWalletSuccessState extends HomeState {
  final String? message;

  AddWalletSuccessState({this.message});
}

class AddWalletErrorState extends HomeState {

  final String? message;

  AddWalletErrorState({this.message});
}

/// Add Drivers States
class AddDriverLoadingState extends HomeState {}

class AddDriverSuccessState extends HomeState {
  final String? message;

  AddDriverSuccessState({this.message});
}

class AddDriverErrorState extends HomeState {

  final String? message;

  AddDriverErrorState({this.message});
}

/// Get All Garages States
final class GetAllGaragesLoadingState extends HomeState {}

final class GetAllGaragesSuccessState extends HomeState {
  final String? message;

  GetAllGaragesSuccessState({this.message});
}

final class GetAllGaragesErrorState extends HomeState {
  final String? message;

  GetAllGaragesErrorState({this.message});
}

final class UpdateGarageLoadingState extends HomeState {}

final class UpdateGarageSuccessState extends HomeState {
  final String? message;

  UpdateGarageSuccessState({this.message});
}

final class UpdateGarageErrorState extends HomeState {
  final String? message;

  UpdateGarageErrorState({this.message});
}


/// Delete Specific Garage States
class DeleteSpecificGarageLoadingState extends HomeState {}

class DeleteSpecificGarageSuccessState extends HomeState {
  final String? message;

  DeleteSpecificGarageSuccessState({this.message});
}

class DeleteSpecificGarageErrorState extends HomeState {

  final String? message;

  DeleteSpecificGarageErrorState({this.message});
}

/// Delete Specific Driver States
class DeleteSpecificDriverLoadingState extends HomeState {}

class DeleteSpecificDriverSuccessState extends HomeState {
  final String? message;

  DeleteSpecificDriverSuccessState({this.message});
}

class DeleteSpecificDriverErrorState extends HomeState {

  final String? message;

  DeleteSpecificDriverErrorState({this.message});
}

/// Add New Garage States
class AddNewGarageLoadingState extends HomeState {}

class AddNewGarageSuccessState extends HomeState {
  final String? message;

  AddNewGarageSuccessState({this.message});
}

class AddNewGarageErrorState extends HomeState {

  final String? message;

  AddNewGarageErrorState({this.message});
}

final class GetAllAttendancesInTodayLoadingState extends HomeState {}

final class GetAllAttendancesInTodaySuccessState extends HomeState {
  final String? message;

  GetAllAttendancesInTodaySuccessState({this.message});
}

final class GetAllAttendancesInTodayErrorState extends HomeState {
  final String? message;

  GetAllAttendancesInTodayErrorState({this.message});
}

final class GetAllAttendancesInStartLoadingState extends HomeState {}

final class GetAllAttendancesInStartSuccessState extends HomeState {
  final String? message;

  GetAllAttendancesInStartSuccessState({this.message});
}

final class GetAllAttendancesInStartErrorState extends HomeState {
  final String? message;

  GetAllAttendancesInStartErrorState({this.message});
}

final class GetAllAttendancesInEndLoadingState extends HomeState {}

final class GetAllAttendancesInEndSuccessState extends HomeState {
  final String? message;

  GetAllAttendancesInEndSuccessState({this.message});
}

final class GetAllAttendancesInEndErrorState extends HomeState {
  final String? message;

  GetAllAttendancesInEndErrorState({this.message});
}