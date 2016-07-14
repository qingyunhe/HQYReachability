//
//  HQYTabBarController.m
//  选项卡控制器的底层实现
//
//  Created by 江城程序猿 on 16/7/3.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYTabBarController.h"

@interface HQYTabBarController ()
/** 底部选项卡 */
@property (nonatomic,weak) UIView *tabBar;

@end

@implementation HQYTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *tabBar = [[UIView alloc] init];
    self.tabBar = tabBar;
    self.view.backgroundColor = [UIColor redColor];

    CGFloat x = 0;
    CGFloat y = [UIScreen mainScreen].bounds.size.height - 49;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = 49;
    tabBar.frame = CGRectMake(x, y, w, h);
    
    [self.view addSubview:tabBar];
    
    // 设置选项卡上的按钮
    [self setButtonForTabBar];
}


// viewWillAppear方法比viewDidLoad方法先调用,必须在viewWillAppear方法中添加按钮
/**
 *  设置选项卡上的按钮
 */
- (void)setButtonForTabBar{

    NSInteger count = self.childViewControllers.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat h = 49;
    for (NSInteger i = 0; i < count; ++i) {
        x = w * i;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x, y, w, h);
        btn.tag = i;
        [self.tabBar addSubview:btn];
        
        // 要给选项卡控制器的按钮设置按钮,按钮上的内容是由各个子控制器决定的,首先要拿到子控制器
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

@end