part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{
  final ProductsDataModel wishlistItems;
  WishListInitialEvent({required this.wishlistItems});

}

// class RemoveFromWishListEvent extends WishListEvent{
//
// }
