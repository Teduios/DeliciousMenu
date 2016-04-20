//
//  StepTableViewCell.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) UIFont *currFont;
@property (nonatomic,strong) StepModel *stepmodel;
-(void)initText;
@end
