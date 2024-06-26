part of 'home_cubit.dart';

sealed class HomeState {}

// the following are the states I'm going to "emit" in this cubit 
final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductItemModel> products;
  final List<AnnouncementModel> announcements;
  HomeLoaded(this.products, this.announcements);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
