import 'dart:convert';

import 'package:chatting/configs/configs.dart';
import 'package:chatting/models/mpesa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PaymentServices with ChangeNotifier {
  MpesaModel mpesaModel;
  Future<void> creditPaymentRequest(context, int billing_phone_number) async {
    Map bodyCredentials = {"phone_number": billing_phone_number, "amount": 10};

    var headers = {"Content-Type": "application/json", "Vary": "Accept"};
    var body = json.encode(bodyCredentials);
    final http.Response response =
        await http.post(PAYBASE_URL, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("RESPONSE ${response.body}");
      var data = json.decode(response.body);
      // this.mpesaModel = data;
      // print(" Transaction Checkout id ${mpesaModel.checkoutRequestId}");
    }
    notifyListeners();
  }
}
