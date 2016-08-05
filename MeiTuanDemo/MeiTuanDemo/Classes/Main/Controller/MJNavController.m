//
//  MJNavController.m
//  MeiTuanDemo
//
//  Created by kimi on 8/5/16.
//  Copyright © 2016 kimi. All rights reserved.
//

#import "MJNavController.h"

@interface MJNavController ()

@end

@implementation MJNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置透明
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    // 设置nav所有的tintColor默认为白色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    // 默认nav是白色的
    [self.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    
    // 如果这个控制器不是第一个控制器,那么应该设置隐藏tabbar的属性
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
