part of 'dashboard_bloc.dart';

enum PhotoApiStatus { loading, success, failure }

class DashboardState extends Equatable {
  final PhotoApiStatus photoApiStatus;
  final List<PhotoApiModel> photoList;
  final String errorMessage;

  const DashboardState({
    this.photoApiStatus = PhotoApiStatus.loading,
    this.photoList = const <PhotoApiModel>[],
    this.errorMessage = '',
  });

  DashboardState copyWith(
      {PhotoApiStatus? photoApiStatus,
      List<PhotoApiModel>? photoList,
      String? errorMessage}) {
    return DashboardState(
      photoApiStatus: photoApiStatus ?? this.photoApiStatus,
      photoList: photoList ?? this.photoList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [photoApiStatus, photoList, errorMessage];
}

final class DashboardInitial extends DashboardState {}
