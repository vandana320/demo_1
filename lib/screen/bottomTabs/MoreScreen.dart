import 'package:demo_app/ui/BaseState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoreScreenState();
  }
}

class _MoreScreenState extends BaseState<MoreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var loaderView =
        Center(child: CircularProgressIndicator(backgroundColor: Colors.blue));
    final iconSize = 24.0;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('More'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 10.0),
            _listTileItem(Icons.person, iconSize, 'My Profile'),
            SizedBox(height: 2.0),
            _listTileItem(Icons.exit_to_app, iconSize, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget _listTileItem(IconData iconData, double iconSize, String title) {
    return ListTile(
      leading: Icon(
        iconData,
        size: iconSize,
      ),
      onTap: () {},
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
