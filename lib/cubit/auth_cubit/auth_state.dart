part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

sealed class ChatState {}

sealed class LoginCubitState {}

final class LoginCubitSuccess extends AuthState {}

final class LoginCubitLoading extends AuthState {}

final class LoginCubitFailler extends AuthState {
  String errorMessage;
  LoginCubitFailler({required this.errorMessage});
}

final class RegisterCubitSuccess extends AuthState {}

final class RegisterCubitLoading extends AuthState {}

final class RegisterCubitFailler extends AuthState {
  String errorMessage;
  RegisterCubitFailler({required this.errorMessage});
}
