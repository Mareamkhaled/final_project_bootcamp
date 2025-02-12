part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {}
// ignore: must_be_immutable
final class LoginFailure extends LoginState {
  String errorMsg;
  LoginFailure({required this.errorMsg});
}
