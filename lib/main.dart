import 'package:flutter/material.dart';
import 'features/home/ui/home.dart';
import 'package:bloc_statemanagement/features/counter/ui/counter_page.dart';
import 'package:bloc_statemanagement/equtable_package/equtable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const EquatableTesting(),
      // home: const CounterPage(),
      // home: const MyHomePage(),
    );
  }
}


