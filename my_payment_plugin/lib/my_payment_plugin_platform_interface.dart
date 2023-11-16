import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_payment_plugin_method_channel.dart';

abstract class MyPaymentPluginPlatform extends PlatformInterface {
  /// Constructs a MyPaymentPluginPlatform.
  MyPaymentPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyPaymentPluginPlatform _instance = MethodChannelMyPaymentPlugin();

  /// The default instance of [MyPaymentPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyPaymentPlugin].
  static MyPaymentPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyPaymentPluginPlatform] when
  /// they register themselves.
  static set instance(MyPaymentPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
