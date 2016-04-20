//
//  MarkCollectionViewCell.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/24.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarkCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *markImg;
@property (weak, nonatomic) IBOutlet UILabel *markName;
@property (nonatomic,strong) infoModel *model;
@end
