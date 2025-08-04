import 'package:flutter/material.dart';
import 'package:bloc_statemanagement/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_statemanagement/features/cart/ui/cart_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _body(context));
  }

  PreferredSize _appBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text('Cart Page'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _body(context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, state) {},
      listenWhen: (previous, current) => current is CartActionableState,
      buildWhen: (previous, current) => current is! CartActionableState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartSuccessState:
            final successState = state as CartSuccessState;
            return ListView.builder(
              itemCount: successState.cartItems.length,
              itemBuilder: (context, index) {
                return CartTileWidget(
                  productsDataModel: successState.cartItems[index],
                  cartBloc: cartBloc,
                );
              },
            );
          default:
        }
        return Container();
      },
    );
  }
}
