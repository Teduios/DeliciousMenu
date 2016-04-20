//
//  MarkCollectionViewCell.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "MarkCollectionViewCell.h"

@implementation MarkCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModel:(infoModel *)model{
    _model = model;
    [_markImg sd_setImageWithURL:[NSURL URLWithString:[model.albums objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"tran"]];
    _markName.text = model.title;
}
@end
