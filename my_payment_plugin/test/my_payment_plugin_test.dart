import 'package:flutter_test/flutter_test.dart';
import 'package:my_payment_plugin/my_payment_plugin.dart';
import 'package:my_payment_plugin/my_payment_plugin_platform_interface.dart';
import 'package:my_payment_plugin/my_payment_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyPaymentPluginPlatform
    with MockPlatformInterfaceMixin
    implements MyPaymentPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyPaymentPluginPlatform initialPlatform = MyPaymentPluginPlatform.instance;

  test('$MethodChannelMyPaymentPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyPaymentPlugin>());
  });

  test('getPlatformVersion', () async {
    MyPaymentPlugin myPaymentPlugin = MyPaymentPlugin();
    MockMyPaymentPluginPlatform fakePlatform = MockMyPaymentPluginPlatform();
    MyPaymentPluginPlatform.instance = fakePlatform;

    expect(await myPaymentPlugin.getPlatformVersion(), '42');
  });
}
