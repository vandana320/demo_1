import 'package:demo_app/ui/BaseState.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

class SourcePageScreen extends StatefulWidget {
  final String url;

  const SourcePageScreen({Key key, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SourcePageScreenState();
  }
}

class _SourcePageScreenState extends BaseState<SourcePageScreen> {
  WebController webController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loaderView = Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.blue,
    ));

    FlutterNativeWeb flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('SourcePage'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(child: _saving ? loaderView : flutterWebView)),
    );
  }

  void onWebCreated(WebController webController) {
    this.webController = webController;
    this.webController.loadUrl(widget.url);
  }
}
