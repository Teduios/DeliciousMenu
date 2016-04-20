//
//  UIButton+ClickBlock.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "UIButton+ClickBlock.h"
#import <objc/runtime.h>
@implementation UIButton (ClickBlock)
static char buttonClickFlag;

- (void)setButtonClickBlock:(ButtonClickBlock)buttonClickBlock{
    objc_setAssociatedObject(self, &buttonClickFlag, buttonClickBlock, OBJC_ASSOCIATION_COPY);
}
- (ButtonClickBlock)buttonClickBlock{
    return objc_getAssociatedObject(self, &buttonClickFlag);
}

@end
