//
//  UpdatingView.m
//  Run
//
//  Created by hgy on 16/3/21.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "UpdatingView.h"
#define UPDATING_HEIGHY  20.f
@interface UpdatingView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *failedLabel;
@property (nonatomic, strong) SnowView *snow;
@end

@implementation UpdatingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:CGRectMake(0, 0, Width / 2.f, Width / 2.f + UPDATING_HEIGHY)];
    if (self) {
        
        [self initLabel];
        [self initSnow];
        
        // 关闭用户交互
        self.userInteractionEnabled = NO;
    }
    
    return self;
}

- (void)initLabel {
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, Width / 2.f, Width / 2.f, UPDATING_HEIGHY)];
    [self addSubview:self.label];
    self.label.textColor        = [UIColor whiteColor];
    self.label.textAlignment    = NSTextAlignmentCenter;
    self.label.font             = [UIFont systemFontOfSize:18];
    self.label.text             = @"Loading . . .";
    self.label.GCDTimerInterval = @(0.8f);
    self.label.glowDuration     = @(0.7f);
    self.label.glowLayerOpacity = @(1.f);
    [self.label createGlowLayerWithColor:[UIColor whiteColor]
                              glowRadius:2.f];
    [self.label startGlow];
    
  
    self.label.alpha               = 0.f;
    
    self.failedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Width / 2.f, Width / 2.f, UPDATING_HEIGHY)];
    [self addSubview:self.failedLabel];
    self.failedLabel.textColor        = [UIColor redColor];
    self.failedLabel.textAlignment    = NSTextAlignmentCenter;
    self.failedLabel.font             =  [UIFont systemFontOfSize:24];
    self.failedLabel.text             = @"Failed";
    self.failedLabel.GCDTimerInterval = @(1.8f);
    self.failedLabel.glowDuration     = @(1.8f);
    self.failedLabel.glowLayerOpacity = @(1.f);
    [self.failedLabel createGlowLayerWithColor:[UIColor redColor]
                                    glowRadius:2.f];
    [self.failedLabel startGlow];
    self.failedLabel.alpha               = 0.f;
}

- (void)initSnow {
    
    self.snow = [[SnowView alloc] initWithFrame:CGRectMake(0, 0, Width / 2.f, Width / 2.f)];
    [self addSubview:self.snow];
    self.snow.snowImage  = [UIImage imageNamed:@"snow"];
    self.snow.birthRate  = 20.f;
    self.snow.gravity    = 5.f;
    self.snow.snowColor  = [UIColor whiteColor];
    self.snow.layer.mask = [CALayer createMaskLayerWithSize:CGSizeMake(Width / 2.f, Width / 2.f)
                                               maskPNGImage:[UIImage imageNamed:@"alpha"]];
    [self.snow showSnow];
    self.snow.transform  = CGAffineTransformMake(1.4, 0, 0, 1.4, 0, 0);
    self.snow.alpha      = 0.f;
}

- (void)show {
    
    [UIView animateWithDuration:1.f animations:^{
        
        self.snow.alpha      = 1.f;
        self.snow.transform  = CGAffineTransformMake(1.f, 0, 0, 1.f, 0, 0);

        self.label.alpha     = 1.f;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:0.75f animations:^{
        
        self.snow.alpha     = 0.f;
        self.snow.transform = CGAffineTransformMake(0.7f, 0, 0, 0.7f, 0, 0);
        self.label.alpha    = 0.f;

        self.failedLabel.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        self.snow.transform    = CGAffineTransformMake(1.4, 0, 0, 1.4f, 0, 0);
    }];
}

- (void)insertIntoView:(UIView *)view {
    
}

- (void)showFailed {
    
    [UIView animateWithDuration:1.5f animations:^{
        
        self.label.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.f animations:^{
 
            self.failedLabel.alpha = 1.f;
            
        } completion:^(BOOL finished) {
            
        }];
    }];
}


@end
