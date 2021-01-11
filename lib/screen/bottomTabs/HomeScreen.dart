import 'package:demo_app/model/ServerResponse.dart';
import 'package:demo_app/model/SportsDetails.dart';
import 'package:demo_app/net/RestServerApi.dart';
import 'package:demo_app/screen/SourcePageScreen.dart';
import 'package:demo_app/ui/BaseState.dart';
import 'package:demo_app/util/CommonUtil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends BaseState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Articles> _details;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _saving = true;
    });
    _getSportsItemDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Icon(Icons.person_pin),
        actions: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.notifications))
        ],
        centerTitle: true,
        title: Text('Home'),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: _buildListItems(),
      ),
    );
  }

  Widget _buildListItems() {
    if (_saving) {
      return Container(
          child: Center(
              child: CircularProgressIndicator(backgroundColor: Colors.blue)));
    } else {
      if (_details == null) {
        return new Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('Please, check your internet connection.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[400])),
                SizedBox(height: 10.0),
                RaisedButton(
                    child: Text('Retry',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center),
                    onPressed: () {
                      _getSportsItemDetails();
                    }),
              ],
            ),
          ),
        );
      } else if (_details.length == 0) {
        return new Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.people,
                  size: 100.0,
                  color: Colors.grey[400],
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Not any details.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.grey[400])))
              ],
            ),
          ),
        );
      } else {
        return ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: _details.length,
            physics: AlwaysScrollableScrollPhysics());
      }
    }
  }

  void _getSportsItemDetails() {
    new RestServerApi()
        .getSportsItemDetails()
        .then((ServerResponse<SportsDetails> result) {
      if (result.Data.articles != null) {
        _details = result.Data.articles;
      }
      setState(() {
        _saving = false;
      });
    }).catchError((onError) {
      print("error in get slide image: $onError");
      setState(() {
        _saving = false;
      });
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = _details[index];
    Widget imgWidget = Image(image: CachedNetworkImageProvider(item.urlToImage));
    Widget nameWidget = Text(
      item.title,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: <Widget>[
        Card(elevation: 4.0, child: imgWidget),
        InkWell(
            child: nameWidget,
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => SourcePageScreen(url: item.url)));
            }),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.remove_red_eye, size: 10, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text("#${item.source.name}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 8))
                ],
              ),
              Text(
                  CommonUtil.convertStringUtcDateToLocal(
                      item.publishedAt, DateFormat('dd/mm/yyyy')),
                  style: TextStyle(color: Colors.black, fontSize: 8))
            ])
      ]),
    );
  }
}
