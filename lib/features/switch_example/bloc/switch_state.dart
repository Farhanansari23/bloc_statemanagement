part of 'switch_bloc.dart';


@immutable
sealed class SwitchState extends Equatable {
  bool isSwitch;
  SwitchState({required this.isSwitch});
  SwitchState copyWith({bool? isSwitch}){
    return SwitchInitial(isSwitch: isSwitch ?? this.isSwitch);
  }
  @override
  List<Object> get props => [isSwitch];
}

final class SwitchInitial extends SwitchState {
  SwitchInitial({required super.isSwitch});
}
