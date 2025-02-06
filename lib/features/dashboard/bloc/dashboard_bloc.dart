import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_application/features/dashboard/model/photo_api_model.dart';
import 'package:flutter_bloc_application/features/dashboard/repository/photo_api_repository.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  PhotoApiRepository photoApiRepository = PhotoApiRepository();

  DashboardBloc() : super(DashboardInitial()) {
    on<PhotoApiFetchEvent>(photoApiFetch);
  }

  FutureOr<void> photoApiFetch(
      PhotoApiFetchEvent event, Emitter<DashboardState> emit)async {
    await photoApiRepository.fetchPhoto().then((value) {
      emit(state.copyWith(
        photoApiStatus: PhotoApiStatus.success,
        errorMessage: 'Api fetch Successful!',
        photoList: value,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        photoApiStatus: PhotoApiStatus.failure,
        errorMessage: '$error',
      ));
    });
  }
}
