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
  void initState() {
    counterBloc.add(CounterIncrementEvent());
    counterBloc.add(CounterAddButtonEvent());
    super.initState();
  }

  int value = 0;

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
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: counterBloc,
      listenWhen: (previous, current) => current is CounterActionState,
      buildWhen: (previous, current) => current is! CounterActionState,
      listener: (context, state) {
        if (state is CounterSnackBarState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('SnackBar')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CounterIncrementState:
            final successState = state as CounterIncrementState;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text('You have pushed the button many times'),
                  Center(
                    child: Text(
                      successState.val.toString(),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {counterBloc.add(CounterSnackBarEvent());}, child: Text('SnackBar')),
                  // Text('$_counter times'),
                ],
              ),
            );
          default:
            return Center(child: Text('Not Found'));
        }
        ;
      },
    );
  }
}

// BlocListener<CounterBloc, CounterState>(
// bloc: counterBloc,
// listener: (context, state) {
// if(state is CounterSnackBarState){
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SnackBar')));
// } else if(state is CounterAddButtonState){
// setState(() {
// value = value + 1;
// });
// }
// },
// child: Center(
// child: Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Text(value.toString(), style: TextStyle(
// fontSize: 64, fontWeight: FontWeight.bold)),
// ),
// ElevatedButton(onPressed: () {
// counterBloc.add(CounterAddButtonEvent());
// }, child: Text('ADD')),
// ElevatedButton(onPressed: () {counterBloc.add(CounterSnackBarEvent());}, child: Text('SnackBar')),
//
// ],
// ),
// ),
// ),
// )

// BlocBuilder<CounterBloc, CounterState>(
// bloc: counterBloc,
// builder: (context, state) {
// switch(state.runtimeType){
// case CounterIncrementState:
// final successState = state as CounterIncrementState;
// return Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// // Text('You have pushed the button many times'),
// Center(
// child: Text(successState.val.toString(),style: TextStyle(fontSize: 64,fontWeight: FontWeight.bold)),
// )
// // Text('$_counter times'),
// ],
// ),
// );
// default:
// return Center(
// child: Text('Not Found'),
// );
// };
// },
// )
