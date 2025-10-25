import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'dart:core';
import 'package:bloc_statemanagement/features/switch_example/bloc/switch_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _body(context));
  }

  PreferredSize _appBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text('App Bar'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _body(context) {
    print('slider');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Notification',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous,current) => previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                print('notification');
                return Switch(
                  value: state.isSwitch,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      EnableNotificationToggleEvent(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(height: 40),
        BlocBuilder<SwitchBloc, SwitchState>(
          buildWhen: (previous, current) => previous.slider != current.slider,
          builder: (context, state) {
            print('red');
            return Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.red.withOpacity(state.slider),
            );
          },
        ),
        SizedBox(height: 40),
        BlocBuilder<SwitchBloc, SwitchState>(
          buildWhen: (previous, current) => previous.slider != current.slider,
          builder: (context, state) {
            // print('hello');
            return Slider(
              value: state.slider,
              onChanged: (value) {
                context.read<SwitchBloc>().add(EnableSliderEvent(slider: value));
              },
            );
          },
        ),
      ],
    );
  }
}
