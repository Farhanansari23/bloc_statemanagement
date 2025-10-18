part of 'switch_bloc.dart';

@immutable
sealed class SwitchState extends Equatable {
  final bool isSwitch;
  final double slider;

  const SwitchState({required this.isSwitch, this.slider = 1.0});

  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchInitial(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object> get props => [isSwitch, slider];
}

final class SwitchInitial extends SwitchState {
  SwitchInitial({required super.isSwitch, super.slider});
}
