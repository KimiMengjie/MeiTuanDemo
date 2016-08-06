//
//  MJMineModel.h
//  MeiTuanDemo
//
//  Created by kimi on 16/8/6.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJMineModel : NSObject

@property (nonatomic,copy)NSString *title;
//@property (nonatomic,copy)NSString *message;
@property (nonatomic,copy)NSString *icon;

@property (nonatomic,assign)BOOL flag;

+ (instancetype)mineModelWithDict:(NSDictionary *)dict;
@end
