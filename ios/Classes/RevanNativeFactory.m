//
//  RevanNativeFactory.m
//  nativeweb_plugin
//
//  Created by 紫荆秋雪 on 2019/6/7.
//

#import "RevanNativeFactory.h"
#import "RevanNativeView.h"

@interface RevanNativeFactory ()
@property (strong, nonatomic) NSObject<FlutterBinaryMessenger> *messenger;

@end

@implementation RevanNativeFactory

/**
 从注册那里传入通信插件
 */
- (void)nativeFactory:(NSObject<FlutterBinaryMessenger>*)messenger {
    self.messenger = messenger;
}


- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    NSLog(@"RevanNativeFactory_args:%@", args);
    return [[RevanNativeView alloc]
            createNativeViewWithFrame:frame
                                               viewIdentifier:viewId
            messenger:self.messenger];
}

@end
