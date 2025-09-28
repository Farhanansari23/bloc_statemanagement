part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

abstract class CounterActionState extends CounterState{}


final class CounterIncrementState extends CounterState{
  final int val;
  CounterIncrementState({required this.val});
}

final class CounterAddButtonState extends CounterActionState{}

final class CounterSnackBarState extends CounterActionState{}