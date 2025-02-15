part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class GetUserSuccess extends LoginState {
  final UserModel userModel;
  GetUserSuccess({required this.userModel});
}

final class GetUserLoading extends LoginState {}

final class GetUserFailure extends LoginState {
  final String errorMsg;
  GetUserFailure({required this.errorMsg});
  @override
  // ignore: hash_and_equals
  int get hashCode => errorMsg.hashCode;
}

final class LoginFailure extends LoginState {
  final String errorMsg;
  LoginFailure({required this.errorMsg});
  @override
  // ignore: hash_and_equals
  int get hashCode => errorMsg.hashCode;
}
