//
//  MenuLoopView.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MenuLoopView;
@protocol MenuLoopViewDelegate <NSObject>
@optional
- (void)loopViewDidSelectedImage:(MenuLoopView *)loopView index:(int)index;
@end

@interface MenuLoopView : UIView
@property (nonatomic, weak) id<MenuLoopViewDelegate> delegate;
@property (nonatomic, assign) BOOL autoPlay;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, strong) NSArray *images;

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images autoPlay:(BOOL)isAuto delay:(NSTimeInterval)timeInterval;
@end
