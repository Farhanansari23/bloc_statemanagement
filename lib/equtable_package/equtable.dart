import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Person person1 = Person(name: 'Farhan', age: 23);
      //     Person person2 = Person(name: 'Amir', age: 21);
      //   },
      //   child: Icon(Icons.add),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      // ),
    );
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text(
            '0',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            Person person1 = Person(name: 'Farhan', age: 23);
            Person person2 = Person(name: 'Amir', age: 21);

            print(person1 == person2);
            print(person1.hashCode.toString());
          },
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ],
    );
  }

}

class Person{
  final String? name;
  final int age;
  const Person({required this.name, required this.age});
}
