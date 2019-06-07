import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

typedef void nativeViewCreatedCallBack(RevanChannelPluginManager channelManager);

/// 通道
class RevanChannelPluginManager {

  MethodChannel _channel;

  RevanChannelPluginManager.init() {
    _channel = MethodChannel('nativewebChannelID');
  }

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod("loadUrlMethod", url);
  }

}

/*
总结：
  在 platformView 中，通道并不会直接在 Flutter 上层使用，
  与 Flutter 上层连接的是 嵌入原生视图的 widget
*/
///在 Flutter树中 嵌入原生是view
class RevanNativeWidget extends StatefulWidget {

  //执行Flutter层的 事件
  nativeViewCreatedCallBack viewCreatedCallBack;

  //构造方法
  RevanNativeWidget({
    @required this.viewCreatedCallBack,
  });

  @override
  State<StatefulWidget> createState() {
    return _RevanNativeWidgetState();
  }
}

class _RevanNativeWidgetState extends State<RevanNativeWidget> {

  //1、通道类型
  final String _channel_name = 'nativeweb';

  //2、原生视图创建成功回调
  Future<void> platformViewCreatedCallBack(int id) async {
    if (widget.viewCreatedCallBack == null) {
      return;
    }
    print('原生视图创建成功回调${id}');
    //执行回调
    widget.viewCreatedCallBack(RevanChannelPluginManager.init());
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: _channel_name,
        onPlatformViewCreated: platformViewCreatedCallBack,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: _channel_name,
        onPlatformViewCreated: platformViewCreatedCallBack,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return Text('此插件暂时不支持 $defaultTargetPlatform');
  }
}