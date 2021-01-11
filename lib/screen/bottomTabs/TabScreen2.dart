import 'package:demo_app/ui/BaseState.dart';
import 'package:flutter/material.dart';

class TabScreen2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TabScreen2State();
  }

}

class _TabScreen2State extends BaseState<TabScreen2>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Text(
              "TabScreen 3 !",
              style: TextStyle(fontSize: 30),
            )),
      ),
    );
  }
}