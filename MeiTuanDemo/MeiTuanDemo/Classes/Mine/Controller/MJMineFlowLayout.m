//
//  MJMineFlowLayout.m
//  MeiTuanDemo
//
//  Created by kimi on 16/8/6.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import "MJMineFlowLayout.h"

@implementation MJMineFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    // 设置cell的间距 和 行间距
    self.minimumLineSpacing = 1;
    self.minimumInteritemSpacing = 1;
    
    // 设置组间距
    self.sectionInset = UIEdgeInsetsMake(0, 0, 20, 0);
}

@end
