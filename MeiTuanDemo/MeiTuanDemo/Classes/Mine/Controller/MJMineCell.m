//
//  MJMineCell.m
//  MeiTuanDemo
//
//  Created by kimi on 16/8/6.
//  Copyright © 2016年 kimi. All rights reserved.
//

#import "MJMineCell.h"
#import "MJMineModel.h"

@interface MJMineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImgBtn;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImgBtn;

@end

@implementation MJMineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setMineModel:(MJMineModel *)mineModel
{
    _mineModel = mineModel;
    
    //显示数据
    self.leftImgBtn.image = [UIImage imageNamed:mineModel.icon];
    self.msgLabel.text = mineModel.title;
    
//    self.rightImgBtn.image = [UIImage imageNamed:mineModel.message];
    //判断标志
    if (!mineModel.flag) {
        [self.msgLabel setTextColor:[UIColor darkGrayColor]];
    }
    
}

@end
