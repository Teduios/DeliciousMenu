//
//  StepTableViewCell.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.//

#import "StepTableViewCell.h"

@implementation StepTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setStepmodel:(StepModel *)stepmodel{
    _stepmodel = stepmodel;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_stepmodel.img] placeholderImage:defaultImage];
    [_textView setText:_stepmodel.step];
    _currFont=[UIFont systemFontOfSize:16];
    [self initText];

}
-(void)initText{
    CGRect textViewRect = CGRectInset(self.contentView.frame, 15, 0);
    //需要显示的文字信息
    NSTextStorage* textStorage = [[NSTextStorage alloc]initWithString:_textView.text];
    //布局
    NSLayoutManager* layoutManager = [[NSLayoutManager alloc]init];
    [textStorage addLayoutManager:layoutManager];
    //文字容器
    NSTextContainer * textContainer = [[NSTextContainer alloc]initWithSize:textViewRect.size];
    [layoutManager addTextContainer:textContainer];
    
    [_textView removeFromSuperview];
    _textView = [[UITextView alloc] initWithFrame:textViewRect textContainer:textContainer] ;
    _textView.editable = NO;
    _textView.selectable = NO;
    _textView.scrollEnabled = NO;
    //UIFont *font=[[UIFont alloc]fontWithSize:17];
   // UIFont *font=[UIFont systemFontOfSize:17];
    if (_currFont) {
        _textView.font = _currFont;
    }
    //_textView.font=font;
    [self.contentView insertSubview:_textView belowSubview:_imgView];
    _textView.textContainer.exclusionPaths = @[[self translatedBezierPath]];
}

-(UIBezierPath*) translatedBezierPath{
    CGRect imgRect = _imgView.frame;
    imgRect.origin.x = 0;
    imgRect.origin.y = 0;
    imgRect.size.width += 20;
    CGRect imageRect=[_textView convertRect:imgRect fromView:self];
    UIBezierPath *newPath = [UIBezierPath bezierPathWithRect:imageRect];
    return  newPath;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
