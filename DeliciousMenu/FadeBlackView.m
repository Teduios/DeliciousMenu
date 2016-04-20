//
//  FadeBlackView.m
//  Run
//
//  Created by hgy on 16/3/21.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "FadeBlackView.h"

@implementation FadeBlackView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:CGRectMake(0, 0, Width, Height)];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:200.0F/255.0f green:200.0F/255.0f blue:99.0f/255.0f alpha:1.0f];
        self.alpha           = 0.f;
    }
    
    return self;
}

- (void)show {
    
    [UIView animateWithDuration:1.f animations:^{
        
        self.alpha = 0.35f;
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:0.75f animations:^{
        
        self.alpha = 0.f;
    }];
}


@end
