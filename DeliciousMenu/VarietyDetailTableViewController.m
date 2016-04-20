//
//  VarietyDetailTableViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/23.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "VarietyDetailTableViewController.h"
#import "InfoCollectionViewController.h"
@interface VarietyDetailTableViewController ()
@property (nonatomic,strong) TagModel *dataSource;
@end

@implementation VarietyDetailTableViewController
- (instancetype)initWithModel:(TagModel *)model
{
    self = [super init];
    self.dataSource = model;
    return self;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    //取消多余分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"iconfont-fanhui"highImage:@"iconfont-fanhui"];
}

#pragma mark - Table view data source

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Id = @"listCell";
    
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Id];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    Tag_ListModel *listmodel = self.dataSource.list[indexPath.row];
    NSString *iconname  = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.imageView.image = [UIImage imageNamed:iconname];
    
    cell.textLabel.text = listmodel.name;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Tag_ListModel *listmodel = self.dataSource.list[indexPath.row];
    InfoCollectionViewController * vc=[[InfoCollectionViewController alloc]initWithTagId:listmodel.id];
    vc.title = listmodel.name;
    [self.navigationController pushViewController:vc animated:YES];

}




@end
