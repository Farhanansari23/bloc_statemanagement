import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc_statemanagement/data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit){
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeFromCartEvent(RemoveFromCartEvent event, Emitter<CartState> emit){
    cartItems.remove(event.productsDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }

}
