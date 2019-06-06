import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nativeweb_plugin/nativeweb_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('nativeweb_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NativewebPlugin.platformVersion, '42');
  });
}
