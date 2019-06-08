//
//  RevanTestViewController.m
//  nativeweb_plugin
//
//  Created by 紫荆秋雪 on 2019/6/8.
//

#import "RevanTestViewController.h"
#import "RevanTest2ViewController.h"

@interface RevanTestViewController ()

@end

@implementation RevanTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UIViewController* controller = [UIApplication sharedApplication].keyWindow.rootViewController;
//
//    UINavigationController *chatNav = [[UINavigationController alloc] init];
//
//    controller.view.window.rootViewController = chatNav;
    
    //    [chatNav pushViewController:vc animated:YES];
    [self.navigationController pushViewController:[RevanTest2ViewController new] animated:YES];
}

@end
