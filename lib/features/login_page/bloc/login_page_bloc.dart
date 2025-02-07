import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitialState()) {
    on<LoginSubmitEvent>(onLoginSubmitted);
  }

  FutureOr<void> onLoginSubmitted(
      LoginSubmitEvent event, Emitter<LoginPageState> emit) async {
    emit(LoginPageLoadingState());
    try {
      await Future.delayed(Duration(seconds: 1));
      if (event.username == 'test' && event.password == '12345678') {
        emit(LoginPageSuccessState('Login Successful'));
      } else {
        emit(LoginPageFailureState('Invalid Credentials!'));
      }
    } catch (error) {
      emit(LoginPageFailureState('$error'));
    }
  }
}
