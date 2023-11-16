// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/services.dart';

import 'my_payment_plugin_platform_interface.dart';

class MyPaymentPlugin {
  static const MethodChannel _channel = MethodChannel('my_payment_plugin');
  Future<String?> getPlatformVersion() {
    return MyPaymentPluginPlatform.instance.getPlatformVersion();
  }

  static Future<void> openPayment() async {
    await _channel.invokeMethod('openPayment');
  }
}
