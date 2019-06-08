//
//  FlutterQRViewController.m
//  nativeweb_plugin
//
//  Created by 紫荆秋雪 on 2019/6/8.
//

#import "FlutterQRViewController.h"
#import "RevanTestViewController.h"
#import "RevanQRCodeManager.h"

@interface FlutterQRViewController ()
    
@property (nonatomic, strong) UINavigationController *navVC;

@end

@implementation FlutterQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navVC = [[UINavigationController alloc] init];
    
//    FlutterViewController* controller = (FlutterViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
//    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    rootVC.view.window.rootViewController = self.navVC;
    
//    [kRevanQRCodeManager revan_qrcodeScanVC:self];
//    [kRevanQRCodeManager setCompleteBlock:^(NSString *result) {
//        NSLog(@"%@", result);
//    }];
    NSLog(@"扫描二维码%@", self.navigationController);
    UIButton *qrBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    qrBtn.backgroundColor = [UIColor purpleColor];
    
    [qrBtn addTarget:self action:@selector(onClickQr) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qrBtn];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [kRevanQRCodeManager revan_qrcodeScanVC:self];
    [kRevanQRCodeManager setCompleteBlock:^(NSString *result) {
        NSLog(@"%@", result);
    }];
}

- (void)onClickQr {
//    [kRevanQRCodeManager revan_qrcodeScanVC:self];
//    [kRevanQRCodeManager setCompleteBlock:^(NSString *result) {
//        NSLog(@"%@", result);
//    }];
    
    UIViewController* controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UINavigationController *chatNav = [[UINavigationController alloc] init];
    
    controller.view.window.rootViewController = chatNav;
    
//    [chatNav pushViewController:vc animated:YES];
    [chatNav pushViewController:[RevanTestViewController new] animated:YES];
}



@end
