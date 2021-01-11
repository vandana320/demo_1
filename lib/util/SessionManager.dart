import 'dart:async';
import 'package:demo_app/model/SportsDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String PREF_KEY_USERID = 'com.demo.pref.PREF_KEY_USERID';

  static final SessionManager _singleton = new SessionManager._internal();

  Future<SharedPreferences> _mPref;

  factory SessionManager() {
    return _singleton;
  }

  SessionManager._internal() {
    _initPref();
  }

  _initPref() {
    _mPref = SharedPreferences.getInstance();
  }
}
