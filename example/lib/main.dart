import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nativeweb_plugin/nativeweb_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //执行 Flutter层的事件
  RevanNativeWidget _nativeWidget = RevanNativeWidget(
      viewCreatedCallBack: (RevanChannelPluginManager channelManager){
        channelManager.loadUrl('https://www.baidu.com');
      }
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NativeWeb'),
        ),
        body: Container(
          color: Colors.red,
          child: _nativeWidget,
        ),
      ),
    );
  }
}
