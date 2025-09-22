import 'package:flutter/material.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bloc_statemanagement/features/cart/bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductsDataModel productsDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    super.key,
    required this.productsDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.96,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width * 0.96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(productsDataModel.imageUrl),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            productsDataModel.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(productsDataModel.description, style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productsDataModel.price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {

                    },
                    icon: FaIcon(FontAwesomeIcons.heart),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(RemoveFromCartEvent(
                        productsDataModel: productsDataModel,
                      ));
                    },
                    icon: FaIcon(FontAwesomeIcons.bagShopping),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
