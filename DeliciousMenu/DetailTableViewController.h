//
//  DetailTableViewController.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "infoModel.h"
@interface DetailTableViewController : UITableViewController
- (id)initWithInfoModel:(infoModel *) model;
                         
@end
