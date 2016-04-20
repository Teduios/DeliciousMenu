//
//  MenuLucyViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/28.
//  Copyright © 2016年 hgy. All rights reserved.
//
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "MenuLucyViewController.h"
#import "DetailTableViewController.h"

#import "GCD.h"
#import "UIImage+initWithColor.h"
#import "UpdatingView.h"
#import "FadeBlackView.h"
@interface MenuLucyViewController ()<MDCSwipeToChooseDelegate>
@property (nonatomic,strong) NSArray * dataSource;
@property (nonatomic,strong) NSMutableArray * imgData;
@property (nonatomic,strong) NSString *listName;
@property (nonatomic,assign) NSUInteger index;
@property (nonatomic,strong) NSMutableArray *viewArray;
@property (nonatomic, strong) FadeBlackView        *fadeBlackView;
@property (nonatomic, strong) UpdatingView         *upDatingView;

@end
@implementation MenuLucyViewController
- (NSMutableArray *)viewArray{
    if (!_viewArray) {
        _viewArray = [[NSMutableArray alloc]init];
    }
    return _viewArray;
}
- (NSMutableArray *)imgData{
    if (!_imgData) {
        _imgData = [[NSMutableArray alloc]init];
    }
    return _imgData;
}
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
   
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lucyMenu"]];

     // 变黑
    self.fadeBlackView = [[FadeBlackView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.fadeBlackView];
    
    // loading
    self.upDatingView        = [[UpdatingView alloc] initWithFrame:CGRectZero];
    self.upDatingView.center = self.view.center;
    [self.view addSubview:self.upDatingView];
    [self refreshMenu];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = YES;
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0.0f]] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(refreshMenu) image:@"iconfont-shuaxin"highImage:@"iconfont-shuaxin-heigh"];
}

- (void)refreshMenu{
    [self.fadeBlackView show];
    [self.upDatingView show];
    [self.imgData removeAllObjects];
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MDCSwipeToChooseView class]]) {
            [view removeFromSuperview];
        }
    }
    _index = 0;
    [self getData];
    
}

- (void)getData{
   
    
        NSUInteger dataCount = self.dataSource.count;
        NSUInteger firstNum = arc4random() % dataCount;
        
        TagModel *model = self.dataSource[firstNum];
        NSUInteger listCount = model.list.count;
        NSUInteger secondNum = arc4random() % listCount;
        Tag_ListModel *list = model.list[secondNum];
        _listName = list.name;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AF接受除了JSON以外的数据类型:
    //Xcode, iOS: iPhone Operator System
    //OC:Objective-C
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    
    

        NSDictionary *parms = @{
                                @"key":@"ac43208232d31be1ec46040844b8d0a0",
                                @"cid":list.id,
                                @"pn":[NSString stringWithFormat:@"%d",0],
                                @"rn":@"10"
                                };
    [manager GET:API_queryByTag parameters:parms success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        int error_code = [[responseObject objectForKey:@"error_code"] intValue];
        
        if (!error_code) {
            
            self.imgData = [infoModel mj_objectArrayWithKeyValuesArray:[[responseObject objectForKey:@"result"] objectForKey:@"data"]];
            
            [self setSwipView];
            
            
            
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@",error.description);
        [self.upDatingView showFailed];
    }];
}

    
    
       

    

- (void)setSwipView{
   
        
       
       
        for (NSUInteger i = _imgData.count ; i > 0  ; i--) {
            MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
            options.likedText = @"Look";
            options.likedColor = [UIColor blueColor];
            options.nopeText = @"Pass";
            options.delegate = self;
          
            MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:CGRectMake(Width*0.1, 104, Width*0.8, Height * 0.6)
                                                                             options:options];
            infoModel *model = self.imgData[i - 1];
            if (i % 3 == 0) {
                 view.transform = CGAffineTransformMakeRotation(-0.02f * i);
            }
           
            
             view.alpha = 0.0f;
            [self.view addSubview:view];
            [self.viewArray addObject:view];
           
            
            [view.imageView sd_setImageWithURL:[NSURL URLWithString:[model.albums objectAtIndex:0]] placeholderImage:defaultImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (i == 1) {
                    [self.fadeBlackView hide];
                    [self.upDatingView hide];
                    for (UIView *view in self.viewArray) {
                      
                            view.alpha = 1.0f;
                        }
                        
                    }
                
                
                
            }];
           
            
                
           
        }
        
        
 
   
    
}
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionRight) {
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return YES;
    }
}

- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionRight) {
//        NSLog(@"MDCSwipeDirectionLeft");
        infoModel *model = self.imgData[_index];
        DetailTableViewController * vc=[[DetailTableViewController alloc]initWithInfoModel:model];
      
        [self.navigationController pushViewController:vc animated:YES];
        _index++;
       
    } else {
        _index++;
      
    }
}
@end
