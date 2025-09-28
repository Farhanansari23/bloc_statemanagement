part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}


class CounterIncrementEvent extends CounterEvent{}

class CounterAddButtonEvent extends CounterEvent{}

class CounterSnackBarEvent extends CounterEvent{}
