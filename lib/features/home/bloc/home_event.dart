part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomePageWishlistButtonClickedEvent extends HomeEvent{

}

class HomePageLikeButtonClickedEvent extends HomeEvent{

}

class HomePageWishlistButtonNavigateEvent extends HomeEvent{

}

class HomePageLikeButtonNavigateEvent extends HomeEvent{

}


