import 'package:flutter/material.dart';
import 'package:bloc_statemanagement/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_statemanagement/features/wishlist/ui/wishlist_tile.dart';


class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  final WishlistBloc wishListBloc = WishlistBloc();

  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  PreferredSize _appBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text('WishList Page'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _body(context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishListBloc,
      listener: (context, state) {},
      listenWhen: (previous, current) => current is WishlistSuccessState,
      buildWhen: (previous, current) => current is  !WishlistSuccessState,
      builder: (context,state){
        switch(state.runtimeType){
          case WishlistSuccessState:
            final successState = state as WishlistSuccessState;
            return ListView.builder(
              itemCount: successState.wishListItems.length,
              itemBuilder: (context, index) {
                return WishlistTile(
                    productsDataModel: successState.wishListItems[index],
                    wishListBloc: wishListBloc,
                );
              },
            );
          default:
        };
        return Container();
      },
    );

  }


}
