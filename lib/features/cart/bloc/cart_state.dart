
// Correct import (verify the path)
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';

part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
abstract class CartActionableState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState{
  final List<ProductsDataModel> cartItems;
 CartSuccessState({required this.cartItems});
}



