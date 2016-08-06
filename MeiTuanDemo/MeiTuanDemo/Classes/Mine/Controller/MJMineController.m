//
//  MJMineController.m
//  MeiTuanDemo
//
//  Created by kimi on 8/5/16.
//  Copyright © 2016 kimi. All rights reserved.
//

#import "MJMineController.h"
#import "MJMineModel.h"
#import "MJMineCell.h"
#import "MJMineInfoCell.h"
#import "MJMineFlowLayout.h"

#define kFirstSectionOptionCount 3
#define kSecondSectionOptionCount 2
#define kThirdSectionOptionCount 2
#define kFourthSectionOptionCount 1
#define kFifthSectionOptionCount 1


static NSString *info_cell_id = @"info_cell";
static NSString *title_cell_id = @"title_cell";
static NSString *bottom_cell_id = @"bottom_cell";

@interface MJMineController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSArray <MJMineModel *> *infosArray;    //我的评价...更多

@end

@implementation MJMineController

-(instancetype)init
{
    //创建布局
    MJMineFlowLayout *flowLayout = [[MJMineFlowLayout alloc]init];
    
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJMineCell" bundle:nil] forCellWithReuseIdentifier:info_cell_id];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJMineInfoCell" bundle:nil] forCellWithReuseIdentifier:title_cell_id];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:bottom_cell_id];
    
    // 背景颜色
    self.collectionView.backgroundColor = [UIColor colorWithHex:0xf5f5f9];
    
    //取消显示导航栏
    [super.navigationController setNavigationBarHidden:YES animated:NO];
    [super.navigationController setToolbarHidden:YES animated:NO];
    

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return kFirstSectionOptionCount;
    }else if (section == 2){
        return kSecondSectionOptionCount;
    }else if (section == 3){
        return kThirdSectionOptionCount;
    }else if (section == 4){
        return kFourthSectionOptionCount;
    }else {
        return kFifthSectionOptionCount;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取数据
    MJMineModel *model =[[MJMineModel alloc]init];
    
    if (indexPath.section == 0) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:title_cell_id forIndexPath:indexPath];
    }else{
        
        if (indexPath.section == 1) {
            model = self.infosArray[indexPath.item];
        }
        if (indexPath.section == 2) {
            model = self.infosArray[indexPath.item + kFirstSectionOptionCount];
        }
        if (indexPath.section == 3) {
            model = self.infosArray[indexPath.item + kFirstSectionOptionCount + kSecondSectionOptionCount];
        }
        if (indexPath.section == 4) {
            model = self.infosArray[indexPath.item + kFirstSectionOptionCount + kSecondSectionOptionCount + kThirdSectionOptionCount];
        }
        if (indexPath.section == 5) {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bottom_cell_id forIndexPath:indexPath];
            
            cell.backgroundColor = [UIColor whiteColor];
            
            UILabel *label = [UILabel labelWithText:@"客服电话:10109777" andTextColor:[UIColor orangeColor] andFontSize:14.0];
            [cell.contentView addSubview:label];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(cell);
            }];
            return cell;
        }
        // 获取cell
        MJMineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:info_cell_id forIndexPath:indexPath];
        // 把数据传递给cell
        cell.mineModel = model;
        
        return cell;
    }
}

// 遵守协议<collectionViewDelegateFlowLayout> 根据系统询问的indexPath(位置) 告诉系统应该有的高度
- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.collectionView.bounds.size.width, 200);
    }
    else  {
        return CGSizeMake(self.collectionView.bounds.size.width, 60);
    }
}

#pragma mark - 懒加载

- (NSArray *)infosArray
{
    if (!_infosArray) {
        //获取URL
        NSURL *url = [[NSBundle mainBundle]URLForResource:@"mineInfo.plist" withExtension:nil];
        //临时数据
        NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
        //保存数据
        NSMutableArray *array = [NSMutableArray array];
        
        for (NSDictionary *dict in tempArray) {
            MJMineModel *model = [MJMineModel mineModelWithDict:dict];
            [array addObject:model];
        }
        _infosArray = array.copy;
    }
    return _infosArray;
}

@end
