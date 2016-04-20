//
//  InfoCollectionViewCell.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.//

#import <UIKit/UIKit.h>

@interface InfoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *infoimg;

@property (weak, nonatomic) IBOutlet UILabel *infolabel;
@property (nonatomic,strong) infoModel *model;
@end
