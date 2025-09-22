part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{

}

class RemoveFromWishListEvent extends WishlistEvent{
  final ProductsDataModel productsDataModel;
  RemoveFromWishListEvent({required this.productsDataModel});
}
