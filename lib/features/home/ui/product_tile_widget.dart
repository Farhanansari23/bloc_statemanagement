import 'package:flutter/material.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductsDataModel productsDataModel;
  const ProductTileWidget({super.key,required this.productsDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height* 0.4,
            width: MediaQuery.of(context).size.width* 0.8,

          ),
          Text(productsDataModel.name),
          Text(productsDataModel.description),
        ],
      ),
    );
  }
}
