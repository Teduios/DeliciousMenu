//
//  fmdbMethod.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class infoModel;
@interface fmdbMethod : NSObject
+ (fmdbMethod *)sharedInstance;
+ (BOOL)urlContains:(NSString *)url;
+ (BOOL)setCacheWithUrl:(NSString *)url :(NSArray *)infoModelArray;
+ (NSArray *)getCacheWithUrl:(NSString *)url;
+ (NSArray *)getStepsCacheWithCookId:(NSString *)cookId;
+ (BOOL)setCacheWithInfoModel:(infoModel *)infoModel;
+ (NSArray *)getHistoryCache;
+ (BOOL)deleteHistoryWithCookId:(NSString*)cookId;
@end
