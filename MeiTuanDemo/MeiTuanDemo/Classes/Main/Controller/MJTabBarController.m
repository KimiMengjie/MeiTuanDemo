//
//  MJTabBarController.m
//  MeiTuanDemo
//
//  Created by kimi on 8/5/16.
//  Copyright © 2016 kimi. All rights reserved.
//

#import "MJTabBarController.h"
#import "MJNavController.h"

@interface MJTabBarController ()

@end

@implementation MJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray* vcs = [NSMutableArray array];
    
    [vcs addObject:[self loadChildViewControllerWithClassName:@"MJHomeController" andImageName:@"icon_tabbar_home" andTitle:@"首页"]];
    [vcs addObject:[self loadChildViewControllerWithClassName:@"MJOrderController" andImageName:@"icon_tabbar_order" andTitle:@"订单"]];
    [vcs addObject:[self loadChildViewControllerWithClassName:@"MJMineController" andImageName:@"icon_tabbar_mine" andTitle:@"我的"]];
    
    self.viewControllers = vcs.copy;
    
    self.tabBar.tintColor = [UIColor colorWithHex:0x7c470a];
}

- (UIViewController*)loadChildViewControllerWithClassName:(NSString*)className andImageName:(NSString*)imageName andTitle:(NSString*)title
{
    
    // 创建子控制器
    Class Clz = NSClassFromString(className);
    UIViewController* vc = [[Clz alloc] init];
    
    // 设置标题
    //    vc.tabBarItem.title = title;
    //    vc.navigationItem.title = title;
    
    vc.title = title; // navBar和tabbar的title都会找这个值
    
    // 获取image
    UIImage* image = [UIImage imageNamed:imageName];
    // 变成使用原始的图片
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置不选中图片
    vc.tabBarItem.image = image;
    
    // 获取image
    UIImage* imageSelected = [UIImage imageNamed:[imageName stringByAppendingString:@"_selected"]];
    // 变成使用原始的图片
    imageSelected = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置不选中图片
    vc.tabBarItem.selectedImage = imageSelected;
    
    // 创建导航控制器把他包起来
    MJNavController* nav = [[MJNavController alloc] initWithRootViewController:vc];
    
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
