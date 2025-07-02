import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bloc_statemanagement/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_statemanagement/features/wishlist/ui/wishlist.dart'; // Add this
import 'package:bloc_statemanagement/features/cart/ui/cart.dart'; // Add this
import 'package:bloc_statemanagement/features/home/ui/product_tile_widget.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    homeBloc.add(HomePageInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionableState,
      buildWhen: (previous ,current) => current is !HomeActionableState,
      listener: (context, state) {
        if(state is HomeNavigateToWishlistPageClickedActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WishListPage()));
        }
        if(state is HomeNavigateToCartPageClickedActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        }
      },
      builder: (context, state) {
      switch(state.runtimeType){
        case HomePageLoadingState:
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case HomePageLoadingSuccessState:
          final successState = state as HomePageLoadingSuccessState;
          return Scaffold(
            appBar: _appBar(context),
            body: ListView.builder(
              itemCount: successState.products.length,
              itemBuilder: (context, index) {
                return ProductTileWidget(productsDataModel: successState.products[index],homeBloc: homeBloc,);
              },
            ),
          );
          case HomePageLoadingErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return SizedBox();
      };
      },
    );
  }

  PreferredSize _appBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text('Central Bazaar'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              homeBloc.add(HomePageWishlistButtonNavigateEvent());
            },
            icon: FaIcon(FontAwesomeIcons.heart),
          ),
          IconButton(
            onPressed: () {
              homeBloc.add(HomePageCartButtonNavigateEvent());
            },
            icon: FaIcon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
    );
  }

//   Widget _body(context) {
//     // final successState = state as HomePageLoadingSuccessState;
//     return null;
//   }

}




