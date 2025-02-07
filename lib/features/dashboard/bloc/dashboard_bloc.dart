import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/features/dashboard/model/photo_api_model.dart';
import 'package:flutter_bloc_application/features/dashboard/repository/photo_api_repository.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  PhotoApiRepository photoApiRepository = PhotoApiRepository();

  DashboardBloc() : super(DashboardInitial()) {
    on<PhotoApiFetchEvent>(photoApiFetch);
  }

  FutureOr<void> photoApiFetch(
      PhotoApiFetchEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(PhotoApiLoadingState());
      Future.delayed(Duration(seconds: 2));
      final List<PhotoApiModel> fetchedPhotos =
          await photoApiRepository.fetchPhoto();

      emit(PhotoApiSuccessState(photoList: fetchedPhotos));
    } catch (error) {
      emit(PhotoApiFailureState('$error'));
    }
  }

// FutureOr<void> photoApiFetch(
//     PhotoApiFetchEvent event, Emitter<DashboardState> emit)async {
//   await photoApiRepository.fetchPhoto().then((value) {
//     emit(state.copyWith(
//       photoApiStatus: PhotoApiStatus.success,
//       errorMessage: 'Api fetch Successful!',
//       photoList: value,
//     ));
//   }).onError((error, stackTrace) {
//     emit(state.copyWith(
//       photoApiStatus: PhotoApiStatus.failure,
//       errorMessage: '$error',
//     ));
//   });
// }
}
