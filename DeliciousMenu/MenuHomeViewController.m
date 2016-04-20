//
//  MenuHomeViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/25.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "MenuHomeViewController.h"
#import "SearchViewController.h"
#import "MarkViewController.h"
#import "PingTransition.h"
#import "FirstStyleTransition.h"
#import "UIImage+initWithColor.h"

@implementation MenuHomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.delegate = self;
    
    
}
- (void)viewDidLoad{
   
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:1.0f]] forBarMetrics:UIBarMetricsDefault];

}
- (void)viewWillDisappear:(BOOL)animated{

    
    [_markButton removeFromSuperview];
    

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self setupNarItem];

}
//转场按钮
- (void)setupNarItem{
    UIButton *markbtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width -54, 0, 44, 44)];
    
    [markbtn setImage:[UIImage imageNamed:@"iconfont-shoucang"] forState:UIControlStateNormal];
    [markbtn addTarget:self action:@selector(mark) forControlEvents:UIControlEventTouchUpInside];
    _markButton = markbtn;
    [self.navigationController.navigationBar addSubview:_markButton];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(search) image:@"iconfont-sousuo-2" highImage:@"iconfont-sousuo-2"];
   
    _markButton.alpha = 0.0f;
    [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _markButton.alpha = 1.0f;
    } completion:nil];
  
    
    
}

- (void)mark{
    MarkViewController *mark = [[MarkViewController alloc]init];
    [UIView animateWithDuration:1.0f animations:^{
        _markButton.alpha = 0.f;
    }];
    [self.navigationController pushViewController:mark animated:YES];
    
}
- (void)search{
    SearchViewController *search = [[SearchViewController alloc]init];
    
    [self.navigationController pushViewController:search animated:YES];
}
////#pragma mark - UINavigationControllerDelegate
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        if ([toVC isKindOfClass:[MarkViewController class]]) {
            PingTransition *ping = [PingTransition new];
            return ping;
        }
        else if([toVC isKindOfClass:[SearchViewController class]]){
            FirstStyleTransition *ging = [FirstStyleTransition new];
            return ging;
        }else{
            return nil;
        }
      
      
        
    }
    else{
        return nil;
    }
   
}
@end
