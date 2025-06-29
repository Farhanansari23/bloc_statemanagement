import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: _appBar(context),
      body: _body(context),
    );
  }

  PreferredSize _appBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text('Central Bazaar'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.heart)),
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.cartShopping)),
        ],
      ),
    );
  }

  Widget _body(context) {
    return Container(
      child: Text('Coming soon'),
    );
  }
}
