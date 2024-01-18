import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sts_one_pay/models/initializeSDK.dart';
import 'package:sts_one_pay/models/sts_one_pay.dart';
import 'package:sts_one_pay/sts_one_pay_method_channel.dart';
import 'package:sts_one_pay/sts_one_pay_platform_interface.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MethodChannelStsOnePay _methodChannelStsOnePay =
      MethodChannelStsOnePay();

  @override
  void initState() {
    InitializeSDK i =InitializeSDK();
    _methodChannelStsOnePay.initializeSDK(InitializeSDK(
        appleMerchantId: "FROM_APPLE_DEVELOPER_PORTAL", //If your app supports Apple
        secretKey: " PROVIDED_BY_SUPPORT " ,//mandatory string
        merchantId: "PROVIDED_BY_SUPPORT" //mandatory string
         ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {

                await _methodChannelStsOnePay.openPaymentPage(
                  StsOnePay(currency: '682', amount: '5000'),
                  onPaymentResponse: (result) {},
                  onPaymentFailed: (result) {},
                  onDeleteCardResponse: (onDeleteCard) {},
                );

            },
            child: const Text('Click'),
          ),
        ),
      ),
    );
  }
}
