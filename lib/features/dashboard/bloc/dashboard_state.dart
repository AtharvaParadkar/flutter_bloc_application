part of 'dashboard_bloc.dart';

// Sealed Class Approach
@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class PhotoApiLoadingState extends DashboardState {}

final class PhotoApiSuccessState extends DashboardState {
  final List<PhotoApiModel> photoList;

  PhotoApiSuccessState({required this.photoList});
}

final class PhotoApiFailureState extends DashboardState {
  final String fail;

  PhotoApiFailureState(this.fail);
}

// Single State Object with an Enum
// enum PhotoApiStatus { loading, success, failure }
//
// @override
// class DashboardState {
//   final PhotoApiStatus photoApiStatus;
//   final List<PhotoApiModel> photoList;
//   final String errorMessage;
//
//   const DashboardState({
//     this.photoApiStatus = PhotoApiStatus.loading,
//     this.photoList = const <PhotoApiModel>[],
//     this.errorMessage = '',
//   });
//
//   // creates a new state based on the current one
//   DashboardState copyWith(
//       {PhotoApiStatus? photoApiStatus,
//       List<PhotoApiModel>? photoList,
//       String? errorMessage}) {
//     return DashboardState(
//       photoApiStatus: photoApiStatus ?? this.photoApiStatus,
//       photoList: photoList ?? this.photoList,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
//
//   // @override
//   // List<Object?> get props => [photoApiStatus, photoList, errorMessage];
// }
