part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

/// Login States
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String? message;

  LoginSuccessState({this.message});
}

class LoginErrorState extends AuthState {
  final String? message;

  LoginErrorState({this.message});
}