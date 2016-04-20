//
//  InfoCollectionViewController.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoCollectionViewController : UICollectionViewController
/** 根据标签id初始化*/
-(id)initWithTagId:(NSString* )tagId;
/** 根据搜索内容初始化*/
-(id)initWithSearchText:(NSString *) searchText;
@end
