part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomePageInitialEvent extends HomeEvent{

}

class HomePageWishlistButtonClickedEvent extends HomeEvent{

}

class HomePageCartButtonClickedEvent extends HomeEvent{

}

class HomePageWishlistButtonNavigateEvent extends HomeEvent{

}

class HomePageCartButtonNavigateEvent extends HomeEvent{

}


