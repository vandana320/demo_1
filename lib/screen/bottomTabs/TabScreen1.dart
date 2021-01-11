import 'package:demo_app/ui/BaseState.dart';
import 'package:flutter/material.dart';

class TabScreen1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TabScreen1State();
  }

}

class _TabScreen1State extends BaseState<TabScreen1>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Text(
              "TabScreen 2 !",
              style: TextStyle(fontSize: 30),
            )),
      ),
    );
  }
}