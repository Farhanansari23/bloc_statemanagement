part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{

}

class RemoveFromCartEvent extends CartEvent{
  final ProductsDataModel productsDataModel;
  RemoveFromCartEvent({required this.productsDataModel});
}
