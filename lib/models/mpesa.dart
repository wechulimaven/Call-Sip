import 'dart:convert';

class MpesaModel {
  MpesaModel({
    this.merchantRequestId,
    this.checkoutRequestId,
    this.responseCode,
    this.responseDescription,
    this.customerMessage,
  });

  String merchantRequestId;
  String checkoutRequestId;
  String responseCode;
  String responseDescription;
  String customerMessage;

  factory MpesaModel.fromJson(Map<String, dynamic> json) => MpesaModel(
        merchantRequestId: json["MerchantRequestID"],
        checkoutRequestId: json["CheckoutRequestID"],
        responseCode: json["ResponseCode"],
        responseDescription: json["ResponseDescription"],
        customerMessage: json["CustomerMessage"],
      );

  Map<String, dynamic> toJson() => {
        "MerchantRequestID": merchantRequestId,
        "CheckoutRequestID": checkoutRequestId,
        "ResponseCode": responseCode,
        "ResponseDescription": responseDescription,
        "CustomerMessage": customerMessage,
      };
}
