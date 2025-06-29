part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
abstract class HomeActionableState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomePageLoadingState extends HomeState{}

class HomePageLoadingSuccessState extends HomeState{}

class HomePageLoadingErrorState extends HomeState{}

class HomeNavigateToWishlistPageClickedActionState extends HomeActionableState{}

class HomeNavigateToCartPageClickedActionState extends HomeActionableState{}

