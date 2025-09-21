part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}
abstract class WishListActionableState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState{
  final List<ProductsDataModel> wishListItems;
  WishlistSuccessState({required this.wishListItems});
}
