import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sts_one_pay/models/sts_one_pay.dart';
import 'package:sts_one_pay/sts_one_pay_method_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'StsOnePay',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            MethodChannelStsOnePay methodChannelStsOnePay =
                MethodChannelStsOnePay();
            await methodChannelStsOnePay.openPaymentPage(
              StsOnePay(
                amount: '5000',
                currency: '682',
              ),
              onResultResponse: (result) {
                log('Token');
                log(result.token ?? '');
              },
              onDeleteCardResponse: (onDeleteCard) {},
            );
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
