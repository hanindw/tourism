part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String message;
  final int role_id;

  LoginSuccess({required this.message, required this.role_id});
}

final class LoginLoading extends LoginState {}

class LoginValidationFailure extends LoginState {
  final Map<String, List<dynamic>> errors;
  LoginValidationFailure({required this.errors});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}
