// import 'package:equatable/equatable.dart';
part of 'switch_bloc.dart';


@immutable
sealed class SwitchEvent {

  SwitchEvent();
  @override
  List<Object> get props => [];
}

class EnableNotificationToggleEvent extends SwitchEvent{

}

class EnableSliderEvent extends SwitchEvent{
  final double slider;
  EnableSliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];

}


// class DisableNotificationToggle extends SwitchEvent{}
