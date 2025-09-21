import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:async/async.dart';
import 'dart:async';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';
import 'package:bloc_statemanagement/data/wishlist_items.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(_wishListInitialEvent);
  }

  FutureOr<void> _wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit,) {
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }
}
