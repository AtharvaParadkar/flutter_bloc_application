part of 'dashboard_bloc.dart';

enum PhotoApiStatus { loading, success, failure }

// @immutable
// sealed class DashboardState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
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

// final class DashboardApiStates extends DashboardState {
//   final PhotoApiStatus photoApiStatus;
//   final List<PhotoApiModel> photoList;
//   final String errorMessage;
//
//   DashboardApiStates({
//     this.photoApiStatus = PhotoApiStatus.loading,
//     this.photoList = const <PhotoApiModel>[],
//     this.errorMessage = '',
//   });
//
//   DashboardApiStates copyWith(
//       {PhotoApiStatus? photoApiStatus,
//       List<PhotoApiModel>? photoList,
//       String? errorMessage}) {
//     return DashboardApiStates(
//       photoApiStatus: photoApiStatus ?? this.photoApiStatus,
//       photoList: photoList ?? this.photoList,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
//
//   @override
//   List<Object?> get props => [photoApiStatus, photoList,errorMessage];
// }
