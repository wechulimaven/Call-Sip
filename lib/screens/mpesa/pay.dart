// ignore_for_file: must_be_immutable

import 'package:chatting/resources/payment_service.dart';
import 'package:chatting/utils/call_utilites.dart';
import 'package:chatting/utils/permissions.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
// import 'package:provider/provider.dart';
// import 'package:saber/providers/mpesaProvider.dart';
// import 'package:flutter_credit_card/credit_card_widget.dart';

class MakeCall extends StatefulWidget {
  final String receiverAvatar;
  final String receiverName;
  final String receiverId;

  final String currUserId;
  final String currUserAvatar;
  final String currUserName;
  final bool isVideo;
  BuildContext context;
  // Function makeCall;

  // TextEditingController textEditingController;

  // Function makeVideoCall;
  MakeCall(
      {Key key,
      @required this.receiverAvatar,
      @required this.receiverName,
      @required this.receiverId,
      @required this.currUserAvatar,
      @required this.currUserName,
      @required this.currUserId,
      @required this.isVideo,
      this.context
      // @required this.makeCall,
      // this.makeVideoCall,
      // @required this.textEditingController,
      })
      : super(key: key);

  @override
  MakeCallState createState() => MakeCallState();
}

class MakeCallState extends State<MakeCall> {
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool errorphone = false;
  bool isLoading = false;

  mpesaCreditPayment(BuildContext context, var phone) async {
    SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    var paymentRepo = Provider.of<PaymentServices>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    _dialog.show(message: "Loading");
    await paymentRepo.creditPaymentRequest(context, int.parse(phone));
    // .then((value) async {
    // String checkout = value["CheckoutRequestID"];
    // if (value != null) {
    await Permissions.cameraAndMicrophonePermissionsGranted()
        ? CallUtils.dial(
            isVideoCall: widget.isVideo,
            currUserId: widget.currUserId,
            currUserName: widget.currUserName,
            currUserAvatar: widget.currUserAvatar,
            receiverId: widget.receiverId,
            receiverAvatar: widget.receiverAvatar,
            receiverName: widget.receiverName,
            context: context)
        : {};

    _dialog.hide();

    // }
    // });

    // if (paymentRepo.mpesaModel.checkoutRequestId != null) {
    //   await Permissions.cameraAndMicrophonePermissionsGranted()
    //       ? CallUtils.dial(
    //           isVideoCall: widget.isVideo,
    //           currUserId: widget.currUserId,
    //           currUserName: widget.currUserName,
    //           currUserAvatar: widget.currUserAvatar,
    //           receiverId: widget.receiverId,
    //           receiverAvatar: widget.receiverAvatar,
    //           receiverName: widget.receiverName,
    //           context: context)
    //       : {};
    // }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    print("INIT STATE INTIN");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 35,
        ),
      )),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                // child: CustomAppBar(),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Phone Number To Complete Payment.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: Container(
                            // width: width,
                            height: 231,
                            decoration: BoxDecoration(
                              // boxShadow: Colors.amber,
                              // AppColors.neumorpShadow,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 30),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  top: 150,
                                  bottom: -200,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue[900]
                                                  .withOpacity(0.2),
                                              blurRadius: 50,
                                              spreadRadius: 2,
                                              offset: Offset(20, 0)),
                                          BoxShadow(
                                              color: Colors.white12,
                                              blurRadius: 0,
                                              spreadRadius: -2,
                                              offset: Offset(0, 0)),
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white30),
                                  ),
                                ),
                                Positioned.fill(
                                  top: -100,
                                  bottom: -100,
                                  left: -300,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue[900]
                                                  .withOpacity(0.2),
                                              blurRadius: 50,
                                              spreadRadius: 2,
                                              offset: Offset(20, 0)),
                                          BoxShadow(
                                              color: Colors.white12,
                                              blurRadius: 0,
                                              spreadRadius: -2,
                                              offset: Offset(0, 0)),
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white30),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            alignment: Alignment.topLeft,
                                            width: 2.0,
                                            child: Image.asset(
                                              "images/safaricom.jpg",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            // height: 9,
                                            // width: 1.5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "2547123*****",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  color: Colors.amber,
                                                  child: Form(
                                                    key: _formKey,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      autocorrect: false,
                                                      controller: phoneNumber,
                                                      onSaved: (value) {
                                                        phoneNumber.text =
                                                            value;
                                                      },
                                                      maxLines: 1,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Enter Phone Number.',
                                                        icon: const Icon(
                                                            Icons.phone),
                                                        labelStyle: TextStyle(
                                                            decorationStyle:
                                                                TextDecorationStyle
                                                                    .solid,
                                                            color: errorphone ==
                                                                    false
                                                                ? Colors.blue
                                                                : Colors.red),
                                                      ),
                                                      validator:
                                                          (String value) {
                                                        if (value.isEmpty) {
                                                          return 'Enter Phone Number To Pay Your Order';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: TextButton(
                                      child: Row(
                                        children: [
                                          Text('Pay 10 /= airtime '),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Icon(Icons.credit_card),
                                          // SizedBox(width: 30),
                                          Spacer(),
                                          ElevatedButton.icon(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              icon: Icon(
                                                Icons.arrow_back_ios_new,
                                                size: 35,
                                              ),
                                              label: Text("Back")),
                                        ],
                                      ),
                                      onPressed: () {
                                        final FormState formState =
                                            _formKey.currentState;
                                        if (phoneNumber.text == '') {
                                          setState(() {
                                            errorphone = true;
                                          });
                                        }
                                        // print(phoneNumber.text);
                                        mpesaCreditPayment(
                                            context, phoneNumber.text);
                                        // print('checking out');
                                        formState.save();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
