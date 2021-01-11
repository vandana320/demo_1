import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:demo_app/util/CommonUtil.dart';
import 'package:demo_app/util/SessionManager.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  ///
  /// send GET request
  ///
  Future<Map<String, dynamic>> get(String methodName,
      {Map<String, String> request}) async {
    request = await setCommonParam(request);
    final url = _buildUrlStringWithQuery(CommonUtil.baseUrl + methodName,
        request);
    Map<String, String> headers = {};
    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      //print('there GET response of api $methodName is : $res');
      return json.decode(res);
    });
  }

  Future<Map<String, dynamic>> setCommonParam(Map<String, dynamic> body) async {
    return body;
  }

  String _buildUrlStringWithQuery(String url, Map<String, String> query) {
    if (query.isEmpty) {
      return url;
    }
    StringBuffer stringBuffer = new StringBuffer();

    query.forEach((key, value) {
      if (stringBuffer.isNotEmpty) {
        stringBuffer.write('&');
      }
      stringBuffer.write(key);
      stringBuffer.write('=');
      stringBuffer.write(Uri.encodeQueryComponent(value));
    });
    return url + '?' + stringBuffer.toString();
  }
}
