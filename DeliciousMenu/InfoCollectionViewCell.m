//
//  InfoCollectionViewCell.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.//

#import "InfoCollectionViewCell.h"

@implementation InfoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModel:(infoModel *)model{
    _model = model;
    [_infoimg sd_setImageWithURL:[NSURL URLWithString:[model.albums objectAtIndex:0]] placeholderImage:defaultImage ];
    _infolabel.text = model.title;
    _infolabel.textColor = [UIColor blackColor];
    _infolabel.font = [UIFont systemFontOfSize:15];

}
@end
