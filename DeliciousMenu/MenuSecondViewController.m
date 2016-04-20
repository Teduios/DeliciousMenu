//
//  MenuSecondViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "MenuSecondViewController.h"
#import "VarietyDetailTableViewController.h"
#import "InfoCollectionViewController.h"
#import "SecondVarityTableViewCell.h"
#import "UIButton+ClickBlock.h"
@interface MenuSecondViewController()
@property (nonatomic,strong) NSArray * dataSource;
@end
@implementation MenuSecondViewController
- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSArray alloc]init];
        NSString * path=[[NSBundle mainBundle] pathForResource:@"TagList" ofType:@"plist"];
        
        _dataSource = [TagModel mj_objectArrayWithFile:path];
    }
    return _dataSource;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setHeaderView];
    [self setFooterView];
    [self.tableView registerNib:[UINib nibWithNibName:SecondVarietyMenuIdentifier bundle:nil] forCellReuseIdentifier:SecondVarietyMenuIdentifier];
}
- (void)setHeaderView{
   
    CGFloat margin = 5;
    CGFloat width = self.view.width -  2 * margin;
    CGFloat buttonStyleOneWidth = (width - 2 * margin) / 2;
    CGFloat buttonStyleTwoWidth = (buttonStyleOneWidth  - margin)/ 2;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, buttonStyleOneWidth + 2 *margin)];
    //创建styleOneButton
    TagModel *model = self.dataSource[0];
    UIButton *styleOneButton = [[UIButton alloc]initWithFrame:CGRectMake(margin, margin, buttonStyleOneWidth, buttonStyleOneWidth)];
    [styleOneButton setBackgroundImage:[UIImage imageNamed:@"v1"] forState:UIControlStateNormal];
    [styleOneButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
   
    //styleOneButton点击块事件
    __weak typeof (self)WeakSelf = self;
    styleOneButton.buttonClickBlock = ^(void){
        VarietyDetailTableViewController *vc = [[VarietyDetailTableViewController alloc]initWithModel:model];
        vc.title = model.name;

        [WeakSelf.navigationController pushViewController:vc animated:YES];
    };
  
    [headerView addSubview:styleOneButton];
    
    //创建styleTwoButton
    for (int i = 0; i < 4; i++) {
        TagModel *model = self.dataSource[i + 1];
        CGFloat x = (margin * 2 + buttonStyleOneWidth) + i % 2 * (margin + buttonStyleTwoWidth);
        CGFloat y = i / 2 * (margin + buttonStyleTwoWidth) + margin;
        
        UIButton *styleTwoButton = [[UIButton alloc]initWithFrame:CGRectMake(x, y, buttonStyleTwoWidth, buttonStyleTwoWidth)];
        [styleTwoButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        NSString *iconnum = [NSString stringWithFormat:@"v%d",i+2];
        [styleTwoButton setBackgroundImage:[UIImage imageNamed:iconnum] forState:UIControlStateNormal];
        
        
        //styleTwoButton点击块事件
        styleTwoButton.buttonClickBlock = ^(void){
            VarietyDetailTableViewController *vc = [[VarietyDetailTableViewController alloc]initWithModel:model];
            vc.title = model.name;
            [WeakSelf.navigationController pushViewController:vc animated:YES];
            
            
        };

      
          [headerView addSubview:styleTwoButton];
        
    }
    headerView.backgroundColor = BackGroundLineColor;
    self.tableView.tableHeaderView = headerView;
    

}
- (void)setFooterView{
    
    UIView *footerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 64)];
    self.tableView.tableFooterView = footerview;

}
- (void)ButtonClick:(UIButton *)btn{
    
    if (btn.buttonClickBlock) {
        btn.buttonClickBlock();
    }
}
#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3){
        return 2;
    }
    else{
    return 3;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger leftcount = (indexPath.section * 6) + (indexPath.row * 2) + 5;
    NSUInteger rightcount = (indexPath.section * 6) + (indexPath.row * 2) + 6;
    TagModel *leftmodel = self.dataSource[leftcount];
    TagModel *rightmodel = self.dataSource[rightcount];
     SecondVarityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SecondVarietyMenuIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.leftHalfButton setTitle:leftmodel.name forState:UIControlStateNormal];
    [cell.rightHalfButton setTitle:rightmodel.name forState:UIControlStateNormal];
    
    NSUInteger leftimgNum = (indexPath.row * 2) + 1;
    NSUInteger rightimgNum = (indexPath.row * 2) + 2;
    NSString *leftimgName = [NSString stringWithFormat:@"s%ld",leftimgNum];
    NSString *rightimgName = [NSString stringWithFormat:@"s%ld",rightimgNum];
    cell.leftHalfImg.image = [UIImage imageNamed:leftimgName];
    cell.rightHalfImg.image = [UIImage imageNamed:rightimgName];
    
    __weak typeof (self)WeakSelf = self;
    [cell.leftHalfButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.leftHalfButton.buttonClickBlock = ^(void){
        VarietyDetailTableViewController *vc = [[VarietyDetailTableViewController alloc]initWithModel:leftmodel];
        vc.title = leftmodel.name;
        [WeakSelf.navigationController pushViewController:vc animated:YES];
        
        
    };
     [cell.rightHalfButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.rightHalfButton.buttonClickBlock = ^(void){
        VarietyDetailTableViewController *vc = [[VarietyDetailTableViewController alloc]initWithModel:rightmodel];
        vc.title = rightmodel.name;
        [WeakSelf.navigationController pushViewController:vc animated:YES];
        
    };

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 10)];
    lineView.backgroundColor = BackGroundLineColor;
    return lineView;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
@end
