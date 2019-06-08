//
//  RevanNativeView.m
//  nativeweb_plugin
//
//  Created by 紫荆秋雪 on 2019/6/7.
//

#import "RevanNativeView.h"
#import <WebKit/WebKit.h>
#import "FlutterQRViewController.h"


@interface RevanNativeView ()


@end

@implementation RevanNativeView {
    WKWebView *_webView;
    int64_t _viewId;
    FlutterMethodChannel *_channel;
    UIView *_customView;
    FlutterQRViewController *_qrViewVC;
}

- (instancetype)createNativeViewWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                                messenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    _qrViewVC = [[FlutterQRViewController alloc] init];
    _customView = [[UIView alloc] initWithFrame:frame];
    _customView.backgroundColor = [UIColor yellowColor];
    _viewId = viewId;
    _webView = [[WKWebView alloc] initWithFrame:frame];
    _channel = [FlutterMethodChannel methodChannelWithName:@"nativewebChannelID" binaryMessenger:messenger];
    
    __weak __typeof__(self) weakSelf = self;
    [_channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"loadUrlMethod"]) {
            NSURLRequest *rqt = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[call arguments]]];
            [_webView loadRequest:rqt];
        }
    }];
    return self;
}

- (nonnull UIView *)view {
    
    return _qrViewVC.view;
//    return _webView;
//    return _customView;
}

@end
