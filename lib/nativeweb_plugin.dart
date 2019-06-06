import 'dart:async';

import 'package:flutter/services.dart';

class NativewebPlugin {
  static const MethodChannel _channel =
      const MethodChannel('nativeweb_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
