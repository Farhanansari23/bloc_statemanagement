import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(isSwitch: false)) {
    on<EnableNotificationToggleEvent>(_enableNotificationToggleEvent);
  }

  FutureOr<void> _enableNotificationToggleEvent(EnableNotificationToggleEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
