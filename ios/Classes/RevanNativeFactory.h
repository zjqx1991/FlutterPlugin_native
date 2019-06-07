//
//  RevanNativeFactory.h
//  nativeweb_plugin
//
//  Created by 紫荆秋雪 on 2019/6/7.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


NS_ASSUME_NONNULL_BEGIN

@interface RevanNativeFactory : NSObject <FlutterPlatformViewFactory>

/**
 从注册那里传入通信插件
 */
- (void)nativeFactory:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
