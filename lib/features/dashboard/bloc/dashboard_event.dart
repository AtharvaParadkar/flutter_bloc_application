part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotoApiFetchEvent extends DashboardEvent {}
