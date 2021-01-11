import 'package:demo_app/screen/bottomTabs/HomeScreen.dart';
import 'package:demo_app/screen/bottomTabs/MoreScreen.dart';
import 'package:demo_app/screen/bottomTabs/TabScreen1.dart';
import 'package:demo_app/screen/bottomTabs/TabScreen2.dart';
import 'package:demo_app/ui/BaseState.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardScreenState();
  }
}

class _DashBoardScreenState extends BaseState<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _cIndex = 0;
  int _contactTabIndex = 0;
  BuildContext mContext;
  HomeScreen _homeScreen;
  TabScreen1 _tabScreen1;
  TabScreen2 _tabScreen2;
  MoreScreen _moreScreen;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: getPage(_cIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this._cIndex = index;
          });
        },
        currentIndex: _cIndex,
        fixedColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), title: Text('Tab1')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text('Tab2')),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), title: Text('More')),
        ],
      ),
    );
  }

  Widget getPage(int index) {
    if (index == 0) {
      if (_homeScreen == null) {
        _homeScreen = HomeScreen();
      }
      return _homeScreen;
    }
    if (index == 1) {
      if (_tabScreen1 == null) {
        _tabScreen1 = TabScreen1();
      }
      return _tabScreen1;
    }
    if (index == 2) {
      if (_tabScreen2 == null) {
        _tabScreen2 = TabScreen2();
      }
      return _tabScreen2;
    }
    if (index == 3) {
      if (_moreScreen == null) {
        _moreScreen = MoreScreen();
      }
      return _moreScreen;
    }
    return HomeScreen();
  }
}
