//
//  MenuVarietyBaseTableViewCell.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/23.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "MenuVarietyBaseTableViewCell.h"

@implementation MenuVarietyBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 10)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, self.width, 30)];
        [self.contentView addSubview:titleView];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        _titleLabel = titleLabel;
        [titleView addSubview:_titleLabel];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.width - 40, 0, 40, 30)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _titleRightButton = btn;
        
        
        
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{

    if (self.menuVarietyCellButtonClickBlock) {
        self.menuVarietyCellButtonClickBlock();
    }

}
@end
