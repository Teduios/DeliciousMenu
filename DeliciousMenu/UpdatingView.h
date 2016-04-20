//
//  UpdatingView.h
//  Run
//
//  Created by hgy on 16/3/21.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SnowView.h"
#import "UIView+GlowView.h"
#import "CALayer+MaskLayer.h"
@interface UpdatingView : UIView


- (void)insertIntoView:(UIView *)view;

- (void)show;
- (void)hide;
- (void)showFailed;
@end
