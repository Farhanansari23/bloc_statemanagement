import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bloc_statemanagement/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_statemanagement/features/wishlist/ui/wishlist.dart'; // Add this
import 'package:bloc_statemanagement/features/cart/ui/cart.dart'; // Add this

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        return Scaffold(
            appBar: _appBar(context),
            body: _body(context),
        );
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

  Widget _body(context) {
    return Container(child: Text('Coming soon'));
  }
}
