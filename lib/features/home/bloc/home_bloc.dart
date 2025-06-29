import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

   on<HomePageWishlistButtonClickedEvent>(homePageWishlistButtonClickedEvent);
   on<HomePageCartButtonClickedEvent>(homePageCartButtonClickedEvent);

   on<HomePageWishlistButtonNavigateEvent>(homePageWishlistButtonNavigateEvent);
   on<HomePageCartButtonNavigateEvent>(homePageCartButtonNavigateEvent);

  }
  FutureOr<void>homePageWishlistButtonClickedEvent(HomePageWishlistButtonClickedEvent event, Emitter<HomeState> emit){

  }

  FutureOr<void>homePageCartButtonClickedEvent(HomePageCartButtonClickedEvent event, Emitter<HomeState> emit){

  }

  FutureOr<void>homePageWishlistButtonNavigateEvent(HomePageWishlistButtonNavigateEvent event, Emitter<HomeState> emit){
    print("wishlist Navigate clicked ");
    emit(HomeNavigateToWishlistPageClickedActionState());
  }

  FutureOr<void>homePageCartButtonNavigateEvent(HomePageCartButtonNavigateEvent event, Emitter<HomeState> emit){
    print("Cart Navigate clicked ");
    emit(HomeNavigateToCartPageClickedActionState());
  }

}
