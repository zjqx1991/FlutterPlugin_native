#import "NativewebPlugin.h"
#import "RevanNativeFactory.h"

@implementation NativewebPlugin

/**
 注册通道，与上层通信

 @param registrar 注册管理者
 */
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    RevanNativeFactory *nativeFactory = [[RevanNativeFactory alloc] init];
    [nativeFactory nativeFactory:[registrar messenger]];
    [registrar registerViewFactory:nativeFactory withId:@"nativeweb"];
}


//+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
//  FlutterMethodChannel* channel = [FlutterMethodChannel
//      methodChannelWithName:@"nativeweb_plugin"
//            binaryMessenger:[registrar messenger]];
//  NativewebPlugin* instance = [[NativewebPlugin alloc] init];
//  [registrar addMethodCallDelegate:instance channel:channel];
//}
//
//- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
//  if ([@"getPlatformVersion" isEqualToString:call.method]) {
//    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
//  } else {
//    result(FlutterMethodNotImplemented);
//  }
//}

@end
