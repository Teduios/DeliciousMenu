//
//  UIButton+Extension.h
//  tabbar
//
//  Created by hgy on 16/2/19.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
@property (nonatomic,weak) UIImageView *img;
+ (UIButton *)buttonWithItem:(NSString *)icon;
@end
