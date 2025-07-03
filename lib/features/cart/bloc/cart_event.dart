import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';

part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{

}

class RemoveFromCartEvent extends CartEvent{

}
