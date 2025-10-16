import 'package:flutter/material.dart';
import 'features/home/ui/home.dart';
import 'package:bloc_statemanagement/features/counter/ui/counter_page.dart';
import 'package:bloc_statemanagement/equtable_package/equtable.dart';
import 'package:bloc_statemanagement/features/switch_example/ui/switch_example.dart';
import 'package:bloc_statemanagement/features/switch_example/bloc/switch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SwitchBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: const EquatableTesting(),
        home: const SwitchExample(),
        // home: const CounterPage(),
        // home: const MyHomePage(),
      ),
    );
  }
}
