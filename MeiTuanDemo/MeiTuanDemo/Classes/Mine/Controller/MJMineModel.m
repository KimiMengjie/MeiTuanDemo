//
//  MJMineModel.m
//  MeiTuanDemo
//
//  Created by kimi on 16/8/6.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import "MJMineModel.h"

@implementation MJMineModel
+ (instancetype)mineModelWithDict:(NSDictionary *)dict
{
    MJMineModel *model = [[self alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
