import 'dart:async';
import 'dart:io';
import 'package:demo_app/model/SportsDetails.dart';
import 'package:demo_app/model/ServerResponse.dart';
import 'package:demo_app/net/network_util.dart';

class RestServerApi {
  NetworkUtil _netUtil = new NetworkUtil();

  void _setStatusMessageFromJson(
      ServerResponse serverResponse, Map<String, dynamic> res) {
    serverResponse.Message = res["message"];
    serverResponse.Status = res["status"];
  }

  ///
  ///getAdmin UserProfile
  ///
  Future<ServerResponse<SportsDetails>> getSportsItemDetails() async {
    var param = <String, String>{};
    ServerResponse<SportsDetails> serverResponse =
        new ServerResponse<SportsDetails>();

    Map<String, dynamic> res = await _netUtil.get(
        "",
        request: param);
    if (res["articles"] != null) {
      List<dynamic> requestJson = res["articles"];
      serverResponse.Data = new SportsDetails.fromJson(requestJson);
    }
    _setStatusMessageFromJson(serverResponse, res);
    return serverResponse;
  }
}
