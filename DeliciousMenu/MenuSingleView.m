//
//  MenuSingleView.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/23.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "MenuSingleView.h"
@interface MenuSingleView()
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@end
@implementation MenuSingleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.width, self.width)];
       
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _button = btn;
        [self addSubview:btn];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.self.width, self.width, self.height - self.width)];
        _label = label;
        [self addSubview:label];
        
        
    }
    return self;
}
- (void)buildView{
    [_button setImage:[UIImage imageNamed:_buttonImg] forState:UIControlStateNormal];
    _label.text = _descText;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:13];
    

}
- (void)btnClick:(UIButton *)btn{
    if (self.menuSingleViewButtonClickBlock) {
        self.menuSingleViewButtonClickBlock();
    }


}
@end
