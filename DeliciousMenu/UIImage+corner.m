//
//  UIImage+corner.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "UIImage+corner.h"

@implementation UIImage (corner)
- (UIImage *)hgy_imageWithCornerRadius:(CGFloat)radius {
   
    CGRect rect = CGRectMake(0.f, 0.f, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
