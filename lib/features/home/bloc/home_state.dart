import 'package:flutter/material.dart';
import 'package:bloc_statemanagement/features/home/models/home_product_model.dart';

part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
abstract class HomeActionableState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomePageLoadingState extends HomeState{}

class HomePageLoadingSuccessState extends HomeState{
  final List<ProductsDataModel> products;
  HomePageLoadingSuccessState({required this.products});
}

class HomePageLoadingErrorState extends HomeState{}

class HomeNavigateToWishlistPageClickedActionState extends HomeActionableState{}

class HomeNavigateToCartPageClickedActionState extends HomeActionableState{}

class HomePageItemAddedToWishListActionState extends HomeActionableState{}

class HomePageItemAddedToCartActionState extends HomeActionableState{}

