import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

///
/// Common Util is util class with many static methods
class CommonUtil {
  static String CurrentCountry = "US";
  static const MethodChannel _channel =
  const MethodChannel('flutter_native_image');

  ///
  /// Validate email string
  static bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }

  static bool isStringNotEmpty(String str) {
    return str != null && str.isNotEmpty;
  }

  static bool isStringEmpty(String str) {
    return str == null || str.isEmpty;
  }

  static bool isHttpUrl(String url) {
    return url.toLowerCase().startsWith('http');
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  static String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=89f673e5bb764c75b27c55a23caaaf6f";


  static String convertStringUtcDateToLocal(String dateString,
      DateFormat convertedDateTimeFormat) {
    String convertedDateString = dateString;
    DateTime date = DateTime.parse(dateString);
    date = DateTime.utc(
        date.year, date.month, date.day, date.hour, date.minute, date.second);
    final convertedDate = date.toLocal();
    convertedDateString = convertedDateTimeFormat.format(convertedDate);
    return convertedDateString;
  }

  static dynamic getJsonVal(Map<String, dynamic> json, String key) {
    return json.containsKey(key) ? json[key] : null;
  }

  static String stringFormat(String template, List replacements) {
    const String placeholderPattern = '(\{\{([a-zA-Z0-9]+)\}\})';
    var regExp = RegExp(placeholderPattern);
    for (var replacement in replacements) {
      template = template.replaceFirst(regExp, replacement.toString());
    }
    return template;
  }
}
