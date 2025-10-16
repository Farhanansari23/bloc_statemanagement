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

// class DisableNotificationToggle extends SwitchEvent{}
