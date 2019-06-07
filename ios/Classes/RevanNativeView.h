//
//  RevanNativeView.h
//  nativeweb_plugin
//
//  Created by 紫荆秋雪 on 2019/6/7.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RevanNativeView : NSObject <FlutterPlatformView>

- (instancetype)createNativeViewWithFrame:(CGRect)frame
                           viewIdentifier:(int64_t)viewId
                                messenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END
