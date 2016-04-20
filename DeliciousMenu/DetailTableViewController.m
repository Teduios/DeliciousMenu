//
//  DetailTableViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "DetailTableViewController.h"
#import "StepTableViewCell.h"
#import "BurTableViewCell.h"
#import "NSString+Extension.h"
#import "UIImage+initWithColor.h"
@interface DetailTableViewController ()
@property (nonatomic,strong) infoModel *dataSource;
@property (nonatomic,strong) NSMutableArray *materialModel;
@property (strong,nonatomic) UIBarButtonItem *delButton;
@property (strong,nonatomic)UIBarButtonItem *favButton;
@end

@implementation DetailTableViewController
- (id)initWithInfoModel:(infoModel *)model
{
    self = [super init];
    _dataSource = model;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setupTableView];
     self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0.0f]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self setupNavButtonItem];

   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"iconfont-fanhui"highImage:@"iconfont-fanhui"];
    self.navigationController.navigationBar.translucent = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.translucent = NO;

}
- (void)back{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setData{

    _materialModel = [[NSMutableArray alloc]init];
    NSArray *t_ings =  [_dataSource.ingredients componentsSeparatedByString:@";"];
    for (NSString* item in t_ings) {
        StepModel *a = [[StepModel alloc]init];
        NSArray *info = [item componentsSeparatedByString:@","];
        a.img = [info objectAtIndex:0];
        a.step = [info objectAtIndex:1];
        [_materialModel addObject:a];
    }
    
    NSArray *t_burs = [_dataSource.burden componentsSeparatedByString:@";"];
    for (NSString* item in t_burs) {
        StepModel *a = [[StepModel alloc]init];
        NSArray *info = [item componentsSeparatedByString:@","];
        a.img = [info objectAtIndex:0];
        a.step = [info objectAtIndex:1];
        [_materialModel addObject:a];
    }
   
    //缓存历史浏览
   
        if (_dataSource.steps == nil) {
            _dataSource.steps = [fmdbMethod getStepsCacheWithCookId:_dataSource.id];
            
        }
        [fmdbMethod setCacheWithInfoModel:_dataSource];
  
    

}



- (void)setupTableView{
    
    [self.tableView registerNib:[UINib nibWithNibName:StepViewreuseIdentifier bundle:nil] forCellReuseIdentifier:StepViewreuseIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:BurViewreuseIdentifier bundle:nil] forCellReuseIdentifier:BurViewreuseIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setupHeaderView];
    [self setupFooterView];

}

- (void)setupHeaderView{
    
    UIView *headerView = [[UIView alloc]init];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, DetailTableViewHeaderViewHeight)];
      [img sd_setImageWithURL:[_dataSource.albums objectAtIndex:0] placeholderImage:defaultImage];
    [headerView addSubview:img];
    CGSize TitleSize = [_dataSource.title sizeWithFont:[UIFont systemFontOfSize:20]];
    CGFloat titleX = (self.view.width - TitleSize.width)/ 2 ;
    CGFloat titleY = 260;
    UILabel *namelabel = [[UILabel alloc]initWithFrame:(CGRect){{titleX, titleY}, TitleSize}];
    namelabel.text = _dataSource.title;
    [headerView addSubview:namelabel];
   
    CGSize imtroSize = [_dataSource.imtro sizeWithFont:[UIFont systemFontOfSize:14] maxW:self.view.width - 25];
   
    CGFloat imtroX =  25;
    CGFloat imtroY = CGRectGetMaxY(namelabel.frame) + 10;
    UILabel *imtrolabel = [[UILabel alloc]initWithFrame:(CGRect){{imtroX, imtroY}, imtroSize}];
    imtrolabel.text = _dataSource.imtro;
   [imtrolabel setNumberOfLines:0];
    imtrolabel.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:imtrolabel];
    CGFloat headviewHeight = CGRectGetMaxY(imtrolabel.frame) + 20;
    headerView.frame = CGRectMake(0, 0, self.view.width, headviewHeight);
    self.tableView.tableHeaderView = headerView;

}
- (void)setupFooterView{
 UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
    self.tableView.tableFooterView = footerView;

}
#pragma mark -导航栏按钮设置
- (void)setupNavButtonItem{
    
    _favButton = [UIBarButtonItem itemWithTarget:self action:@selector(addInFavSource) image:@"iconfont-weishoucang"highImage:@"iconfont-shanchu"];
   
    _delButton = [UIBarButtonItem itemWithTarget:self action:@selector(deleteFromFavSource) image:@"iconfont-shanchu"highImage:@"iconfont-weishoucang"];
    
    if (![favModels containsObject:_dataSource]) {
        
        self.navigationItem.rightBarButtonItem=_favButton;
    }
    else{//取消收藏按钮
        self.navigationItem.rightBarButtonItem=_delButton;
    }

}
-(void)addInFavSource{
    
    [favModels insertObject:_dataSource atIndex:0];
    [favSource insertObject:[NSKeyedArchiver archivedDataWithRootObject:_dataSource] atIndex:0];//归档
    [[NSUserDefaults standardUserDefaults] setObject:favSource forKey:@"fav"];//更新离线数据
    self.navigationItem.rightBarButtonItem=_delButton;
    ALERT_MESSAGE(@"已加入我的收藏");
    
}

-(void)deleteFromFavSource{
    
    NSUInteger index = [favModels indexOfObject:_dataSource];
    [favModels removeObjectAtIndex:index];
    [favSource removeObjectAtIndex:index];
    [[NSUserDefaults standardUserDefaults] setObject:favSource forKey:@"fav"];//更新离线数据
    self.navigationItem.rightBarButtonItem = _favButton;
    ALERT_MESSAGE(@"已从我的收藏中删除");
}


- (void)alphaNavChontroller:(CGFloat)barAlpha{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:barAlpha]] forBarMetrics:UIBarMetricsDefault];
    
}
//解决group的headerview粘性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
 
   
    CGFloat offset = self.tableView.contentOffset.y;
//         NSLog(@"%lf",offset);
    if (offset >= 150) {
      
        CGFloat delta = (offset - 150)/ 64.f ;
       
        
        [self alphaNavChontroller:delta];
        if (offset >=214) {
            
                self.title = _dataSource.title;
        }
    }
    else{
        self.title = nil;
    }
  
}
#pragma mark -tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 + _dataSource.steps.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
     if (section==0){//材料
        if (_materialModel.count%2!=0) {
            return _materialModel.count/2+1;
        }else{
            return _materialModel.count/2;
        }
    }else{//步骤
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 44;
        
     
    }
    
    else{
        CGSize constraint=CGSizeMake(self.tableView.frame.size.width/3*2, 200000.0f);
    CGSize size=[((StepModel*)[_dataSource.steps objectAtIndex:indexPath.row ]).step sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat height=MAX(size.height, 90);
    
        return height;}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

     if(indexPath.section==0){//材料
        BurTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:BurViewreuseIdentifier];
        if ((indexPath.row+1)*2<=_materialModel.count) {
            StepModel * m=(StepModel*)[_materialModel objectAtIndex:indexPath.row*2];
            cell.name_1.text=m.img;
            cell.value_1.text=m.step;
            m=(StepModel*)[_materialModel objectAtIndex:indexPath.row*2+1];
            cell.name_2.text=m.img;
            cell.value_2.text=m.step;
        }
        else{
            StepModel * m=(StepModel*)[_materialModel objectAtIndex:indexPath.row*2];
            cell.name_1.text=m.img;
            cell.value_1.text=m.step;
            cell.name_2.text=@"";
            cell.value_2.text=@"";
        }
        return cell;
    }
    else {
        StepTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:StepViewreuseIdentifier forIndexPath:indexPath];
        StepModel* model=((StepModel*)[_dataSource.steps objectAtIndex:indexPath.section -1]);
        cell.stepmodel = model;
        return cell;
    }
    
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        CGRect frame = CGRectMake(0, 0, tableView.width, 45);
        UIView *view = [[UIView alloc]initWithFrame:frame];
        view.backgroundColor = BackGroundLineColor;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(view.width / 2 -20, 10, 40, 20)];
        
        label.text = @"材料";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:18];
       
        [view addSubview:label];
        return  view;
    }
    else{
    
        CGRect frame = CGRectMake(0, 0, tableView.width, 45);
        UIView *view = [[UIView alloc]initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]init];
        NSString *text = [NSString stringWithFormat:@"- 步骤%ld -",section];
        CGSize textsize = [text sizeWithFont:[UIFont systemFontOfSize:18]];
        label.frame = CGRectMake((view.width - textsize.width)/2 , 10, textsize.width, textsize.height);
        label.text = text;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:18];
        
        [view addSubview:label];
        return view;
    
    
    }
}



@end
