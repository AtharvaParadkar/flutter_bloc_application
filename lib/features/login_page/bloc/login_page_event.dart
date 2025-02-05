part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoginSubmitEvent extends LoginPageEvent {
  final String username;
  final String password;

  LoginSubmitEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username,password];
}
