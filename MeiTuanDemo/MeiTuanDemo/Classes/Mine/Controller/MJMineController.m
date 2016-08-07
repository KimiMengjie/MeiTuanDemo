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

@interface MJMineController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray <MJMineModel *> *infosArray;    //我的评价...更多

@end

@implementation MJMineController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI
{
    
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:headerView];
    
    UITableViewController *tabelVC = [[UITableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    //加入视图
    [self.view addSubview:tabelVC.view];
    //父子控制器
    [self addChildViewController:tabelVC];
    
    //注册cell
    [tabelVC.tableView registerNib:[UINib nibWithNibName:@"MJMineCell" bundle:nil]  forCellReuseIdentifier:info_cell_id];
    [tabelVC.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:bottom_cell_id];
    
    //设置代理
    tabelVC.tableView.delegate = self;
    tabelVC.tableView.dataSource = self;
    
    // 背景颜色
    tabelVC.tableView.backgroundColor = [UIColor colorWithHex:0xf5f5f9];
    
    //取消显示导航栏
    [super.navigationController setNavigationBarHidden:YES animated:NO];
    [super.navigationController setToolbarHidden:YES animated:NO];
    //取消header头
    
    //取消粘连性
    tabelVC.tableView.tableHeaderView.hidden = YES;
    
    //自动布局
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(200);
    }];
    
    [tabelVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(headerView.mas_bottom);
    }];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return kFirstSectionOptionCount;
    }else if (section == 1){
        return kSecondSectionOptionCount;
    }else if (section == 2){
        return kThirdSectionOptionCount;
    }else if (section == 3){
        return kFourthSectionOptionCount;
    }else {
        return kFifthSectionOptionCount;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取数据
    MJMineModel *model =[[MJMineModel alloc]init];
    
    if (indexPath.section == 0) {
        model = self.infosArray[indexPath.row];
    }
    if (indexPath.section == 1) {
        model = self.infosArray[indexPath.row + kFirstSectionOptionCount];
    }
    if (indexPath.section == 2) {
        model = self.infosArray[indexPath.row + kFirstSectionOptionCount + kSecondSectionOptionCount];
    }
    if (indexPath.section == 3) {
        model = self.infosArray[indexPath.row + kFirstSectionOptionCount + kSecondSectionOptionCount + kThirdSectionOptionCount];
    }
    if (indexPath.section == 4) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bottom_cell_id forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [UILabel labelWithText:@"客服电话:10109777" andTextColor:[UIColor orangeColor] andFontSize:14.0];
        [cell.contentView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell);
        }];
        return cell;
    }
    // 获取cell
    MJMineCell *cell = [tableView dequeueReusableCellWithIdentifier:info_cell_id forIndexPath:indexPath];
    // 把数据传递给cell
    cell.mineModel = model;
    
    return cell;
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
