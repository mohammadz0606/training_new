import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_payment_plugin_platform_interface.dart';

/// An implementation of [MyPaymentPluginPlatform] that uses method channels.
class MethodChannelMyPaymentPlugin extends MyPaymentPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_payment_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
