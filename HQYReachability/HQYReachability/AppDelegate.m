//
//  AppDelegate.m
//  HQYReachability
//
//  Created by 江城程序猿 on 16/7/10.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "AppDelegate.h"
#import "HQYViewController.h"
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[HQYViewController alloc] init];
    [self.window makeKeyAndVisible];
    // 判断网络状态
    [self judgeNetworkStatus];
    
    return YES;
}

#pragma - mark 判断网络状态
- (void)judgeNetworkStatus{
    
    // 1.创建Reachability对象
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    // 2.判断网络状态
    if ([reachability currentReachabilityStatus] == ReachableViaWiFi) {
        // 当前已连接wifi
        [self popUpNetworkStatusNotifications:@"当前已连接wifi"];
    } else if ([reachability currentReachabilityStatus] == ReachableViaWWAN) {
        // 没有使用wifi, 正使用蜂窝数据访问网络
        [self popUpNetworkStatusNotifications:@"正使用蜂窝网络"];
    } else {
        // 请打开设置,连接网络
        [self connectNetwork:@"打开设置界面"];
    }
}

#pragma - mark 弹出联网状态弹窗
- (void)popUpNetworkStatusNotifications:(NSString *) string{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"联网状态提醒" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *tipButton = [UIAlertAction actionWithTitle:string style:(UIAlertActionStyleCancel) handler:nil];
    
    [alertController addAction:tipButton];
    
    [self.window.rootViewController presentViewController:alertController animated:YES completion: nil];
}

#pragma - mark 打开系统设置页面
- (void)connectNetwork:(NSString *) string{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"联网状态提醒" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *tipButton = [UIAlertAction actionWithTitle:string style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=INTERNET_TETHERING"]];
    }];
    
    [alertController addAction:tipButton];
    
    [self.window.rootViewController presentViewController:alertController animated:YES completion: nil];
}

@end
