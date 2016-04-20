//
//  FirstStyleTransition.m
//  DeliciousMenu
//
//  Created by tarena on 16/3/27.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "FirstStyleTransition.h"
#import "SearchViewController.h"
#import "MenuHomeViewController.h"
@interface FirstStyleTransition()

@property(nonatomic,strong)id<UIViewControllerContextTransitioning>transitionContext;

@end
@implementation FirstStyleTransition
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 1.7f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    self.transitionContext = transitionContext;
    
    MenuHomeViewController *fromVC = (MenuHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SearchViewController *toVC   = (SearchViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
   
    CGFloat width = [[UIScreen mainScreen]bounds].size.width;
    CGFloat height = [[UIScreen mainScreen]bounds].size.height;
    toVC.view.frame = CGRectMake(0, -height, width, height);
    fromVC.view.frame = CGRectMake(0, 0, width, height);
    //3
    [containerView addSubview:toVC.view];
//     [containerView addSubview:fromVC.view];
    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.80 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = CGRectMake(0, 64, width, height);
        fromVC.view.frame = CGRectMake(0, height, width, height);
    } completion:^(BOOL finished) {
        //5
        [transitionContext completeTransition:YES];
    }];
    
    
 

    
    
   
    
}


@end
