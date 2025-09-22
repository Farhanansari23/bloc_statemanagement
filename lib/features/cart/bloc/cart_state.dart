part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionableState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState{
  final List<ProductsDataModel> cartItems;
 CartSuccessState({required this.cartItems});
}



