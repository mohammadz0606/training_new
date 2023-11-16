import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: const TestNative(),
      ),
    );
  }
}

class TestNative extends StatefulWidget {
  const TestNative({super.key});

  @override
  State<TestNative> createState() => _TestNativeState();
}

class _TestNativeState extends State<TestNative> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  static const MethodChannel _channel = MethodChannel('samples.flutter.dev/payment');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "openPayment":
      // Implement your payment logic here
      // For simplicity, let's print a message
        print("Opening payment from Kotlin!");
        break;
      default:
        throw MissingPluginException();
    }
  }
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
/*      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';*/
      _channel.setMethodCallHandler(_handleMethod);
    } on PlatformException catch (e) {
     // batteryLevel = "Failed to get battery level: '${e.message}'.";
      print("error");
      print(e.message);
    }
/*
    setState(() {
      _batteryLevel = batteryLevel;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
