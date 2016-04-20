//
//  UIButton+Extension.m
//  tabbar
//
//  Created by hgy on 16/2/19.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
- (void)setImg:(UIImageView *)img
{
    self.img = img;

}
- (UIImageView *)img
{
    return self.img;
}
+ (UIButton *)buttonWithItem:(NSString *)icon
{
    UIImageView *img = [[UIImageView alloc]init];
    img.image = [UIImage imageNamed:@"iconfont-delete"];
    UIButton *btn = [[UIButton alloc]init];
    img.center = btn.center;
    
    [btn  addSubview:img];
    return btn;
    

}
@end
