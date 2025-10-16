import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(context),
      body: _body(context),
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

  Widget _body(context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Notification',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
             Switch(value: true, onChanged: (value) {
                return null;
            }),
          ],
        ),
        SizedBox(height: 40,),
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.red.withOpacity(0.2),
        ),
        SizedBox(height: 40,),
        Slider(value: 0.4, onChanged: (value){}),
      ],
    );
  }
}
