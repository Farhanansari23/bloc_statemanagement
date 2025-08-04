
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomePageInitialEvent extends HomeEvent{

}

class HomePageWishlistButtonClickedEvent extends HomeEvent{
  final ProductsDataModel likedProduct;
  HomePageWishlistButtonClickedEvent({required this.likedProduct});

}

class HomePageCartButtonClickedEvent extends HomeEvent{
 final ProductsDataModel cartProduct;
 HomePageCartButtonClickedEvent({required this.cartProduct});
}

class HomePageWishlistButtonNavigateEvent extends HomeEvent{

}

class HomePageCartButtonNavigateEvent extends HomeEvent{

}


