part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SignUPInitial extends SignupState {}
final class SignUPLoading extends SignupState {}
final class SignUPSuccess extends SignupState {}
// ignore: must_be_immutable
final class SignUPFailure extends SignupState {
  String errorMsg;
  SignUPFailure({required this.errorMsg});
}
