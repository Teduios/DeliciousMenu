//
//  FirstBackTransition.m
//  DeliciousMenu
//
//  Created by tarena on 16/3/27.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "FirstBackTransition.h"
#import "MenuHomeViewController.h"
#import "SearchViewController.h"
@interface FirstBackTransition ()
@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation FirstBackTransition
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 1.7f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    self.transitionContext = transitionContext;
    
    SearchViewController *fromVC = (SearchViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    MenuHomeViewController *toVC   = (MenuHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  
    UIView *containerView = [transitionContext containerView];
    
    CGFloat width = [[UIScreen mainScreen]bounds].size.width;
    CGFloat height = [[UIScreen mainScreen]bounds].size.height;
    fromVC.view.frame = CGRectMake(0, 64, width, height);
    toVC.view.frame = CGRectMake(0, -height, width, height);
   
    //3
    [containerView addSubview:fromVC.view];
     [containerView addSubview:toVC.view];
    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:1.90 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.frame = CGRectMake(0, height + 64, width, height);
        toVC.view.frame = CGRectMake(0, 64, width, height - 64);
    } completion:^(BOOL finished) {
        //5
        
        [transitionContext completeTransition:YES];
    }];
    
    
    
    
    
    
    
    
}

@end
