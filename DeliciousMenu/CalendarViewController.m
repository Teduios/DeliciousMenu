//
//  CalendarViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "CalendarViewController.h"
#import "DetailTableViewController.h"
#import <UIImageView+WebCache.h>

@interface CalendarViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView * tableView;
@property (strong,nonatomic) NSMutableArray * dataSource;
@end

@implementation CalendarViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"最近浏览"];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self getData];
}
- (void)getData{
    _dataSource=[NSMutableArray arrayWithArray:[fmdbMethod getHistoryCache] ];
    [_tableView reloadData];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSLog(@"可以删除了");
        [ fmdbMethod deleteHistoryWithCookId:((infoModel *)[_dataSource objectAtIndex:indexPath.row]).id];
        
        [_dataSource removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailTableViewController *vc = [[DetailTableViewController alloc]initWithInfoModel:(infoModel *)[_dataSource objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    infoModel *model = (infoModel *)[_dataSource objectAtIndex:indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[model.albums objectAtIndex:0]] placeholderImage:defaultImage];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.imtro;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
@end
