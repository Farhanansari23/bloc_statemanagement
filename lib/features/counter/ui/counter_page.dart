import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  final CounterBloc counterBloc = CounterBloc();

  @override
  void initState(){
    counterBloc.add(CounterIncrementEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
        child: Icon(Icons.add),
      ),

    );
  }

  PreferredSize _appBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text('Counter Page'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _body(context) {
    print('hello');
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: counterBloc,
      builder: (context, state) {
        switch(state.runtimeType){
          case CounterIncrementState:
            final successState = state as CounterIncrementState;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text('You have pushed the button many times'),
                  Center(
                    child: Text(successState.val.toString(),style: TextStyle(fontSize: 64,fontWeight: FontWeight.bold)),
                  )
                  // Text('$_counter times'),
                ],
              ),
            );
          default:
            return Center(
              child: Text('Not Found'),
            );
        };
      },
    );
  }
}
