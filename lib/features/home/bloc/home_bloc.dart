import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc_statemanagement/data/grocery_data.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomePageInitialEvent>(homePageInitialEvent);

    on<HomePageWishlistButtonClickedEvent>(homePageWishlistButtonClickedEvent);
    on<HomePageCartButtonClickedEvent>(homePageCartButtonClickedEvent);

    on<HomePageWishlistButtonNavigateEvent>(
      homePageWishlistButtonNavigateEvent,
    );
    on<HomePageCartButtonNavigateEvent>(homePageCartButtonNavigateEvent);
  }

  FutureOr<void> homePageInitialEvent(HomePageInitialEvent event, Emitter<HomeState> emit,) async {
    emit(HomePageLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomePageLoadingSuccessState(
        products:
            GroceryData.groceryProducts
                .map(
                  (e) => ProductsDataModel(
                    id: e['id'],
                    name: e['name'],
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl'],
                  ),
                )
                .toList(),
      ),
    );
  }

  FutureOr<void> homePageWishlistButtonClickedEvent(
    HomePageWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homePageCartButtonClickedEvent(
    HomePageCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homePageWishlistButtonNavigateEvent(
    HomePageWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("wishlist Navigate clicked ");
    emit(HomeNavigateToWishlistPageClickedActionState());
  }

  FutureOr<void> homePageCartButtonNavigateEvent(
    HomePageCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart Navigate clicked ");
    emit(HomeNavigateToCartPageClickedActionState());
  }
}
