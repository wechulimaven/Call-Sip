import 'dart:math';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:chatting/configs/configs.dart';
import 'package:chatting/constants.dart';
import 'package:chatting/models/call.dart';
import 'package:chatting/models/log.dart';
import 'package:chatting/resources/get_token.dart';
import 'package:chatting/screens/CallScreens/call_screen.dart';
import 'package:chatting/resources/call_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial(
      {String currUserAvatar,
      String currUserName,
      String currUserId,
      String receiverAvatar,
      String receiverName,
      String receiverId,
      context}) async {
    Call call = Call(
      callerId: currUserId,
      callerName: currUserName,
      callerPic: currUserAvatar,
      receiverId: receiverId,
      receiverName: receiverName,
      receiverPic: receiverAvatar,
      channelId: Random().nextInt(1000).toString(),
    );

    Log log = Log(
        callerName: currUserName,
        callerPic: currUserAvatar,
        callStatus: CALL_STATUS_DIALLED,
        receiverName: receiverName,
        receiverPic: receiverAvatar,
        timestamp: DateTime.now().toString());

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Firestore.instance
          .collection("Users")
          .document(currUserId)
          .collection("callLogs")
          .document(log.timestamp)
          .setData({
        "callerName": log.callerName,
        "callerPic": log.callerPic,
        "callStatus": log.callStatus,
        "receiverName": log.receiverName,
        "receiverPic": log.receiverPic,
        "timestamp": log.timestamp
      });
    // String data = await getAccessToken(
    //   account: ACCOUNT_ID,
    //   app_Certificate: APP_CCERTIFICATE_ID,
    //   app_id: APP_ID,
    //   channel_name: call.channelId,
    //   role: ClientRole.Broadcaster.toString()
    // );


      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(
              call: call,
              // token: data,
              // role: ClientRole.Broadcaster,
            ),
          ));
    }
  }
}
