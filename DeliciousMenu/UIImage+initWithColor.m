//
//  UIImage+initWithColor.m
//  nav
//
//  Created by hgy on 16/3/17.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "UIImage+initWithColor.h"

@implementation UIImage (initWithColor)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    // create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
