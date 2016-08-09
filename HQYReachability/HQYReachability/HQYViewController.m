//
//  HQYViewController.m
//  HQYReachability
//
//  Created by 江城程序猿 on 16/7/10.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYViewController.h"

@interface HQYViewController ()

@end

@implementation HQYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *baozouImageView = [[UIImageView alloc] init];
    baozouImageView.frame = self.view.bounds;
    baozouImageView.image = [UIImage imageNamed:@"帅帅的程序猿"];
    [self.view addSubview:baozouImageView];
    
}

@end
