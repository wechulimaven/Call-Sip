import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chatting/configs/configs.dart';

Future<String> getAccessToken({
  @required String app_id,
  @required String app_Certificate,
  @required String role,
  @required String channel_name,
  String uid,
  @required String account,
}) async{
  final headers = {
    'content-type': 'application/json',
    'Vary': 'Accept'
  };

  Map userCredentials = {
    "appId": app_id,
    "appCertificate": app_Certificate,
    "channelName": channel_name,
    "account": account,
    "uid": uid,
    "role": role //"Role_Publisher"
  };

  var body = json.encode(userCredentials);

  final http.Response response = await http.post(BASE_URL, headers: headers,body: body);

  if(response.statusCode == 200){
    final String token = json.decode(response.body);
    print("Token $token");
    return token;
  }else{
    return "An Error Occured";
  }
}
