import 'package:chatting/resources/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:chatting/constants.dart';
import 'package:provider/provider.dart';
import 'screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PaymentServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ColSip',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
