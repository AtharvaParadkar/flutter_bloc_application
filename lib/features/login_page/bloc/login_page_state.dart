part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageState {}

final class LoginPageInitialState extends LoginPageState {}

class LoginPageLoadingState extends LoginPageState {}

class LoginPageSuccessState extends LoginPageState {
  final String success;

  LoginPageSuccessState(this.success);
}

class LoginPageFailureState extends LoginPageState{
  final String error;

  LoginPageFailureState(this.error);
}
