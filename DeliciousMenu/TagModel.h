//
//  TagModel.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject
@property (nonatomic, strong) NSString *parentId;
/** 大类名称*/
@property (nonatomic, strong) NSString *name;
/** 小分类*/
@property (nonatomic, strong) NSArray *list;
@end

@interface Tag_ListModel : NSObject
/** 分类ID*/
@property (nonatomic, strong) NSString *id;
/** 小分类名称*/
@property (nonatomic, strong) NSString *name;
/** 所属大分类ID*/
@property (nonatomic, strong) NSString *parentId;
@end
