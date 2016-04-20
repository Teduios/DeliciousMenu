//
//  MenuConst.h
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MBProgressHUD.h>
#define BackGroundLineColor [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0f]
extern NSString *const OpenID;
extern NSString *const APPID;
extern NSString *const Method_Get;
extern NSString *const Method_Post;

extern NSMutableArray * favSource;//收藏数据,离线,存放NSData
extern NSMutableArray * favModels;//收藏数据,存放对象,程序在所有操作中都使用此对象,只有存档时使用NSData
extern FMDatabase *db;//数据库
extern UIImage *   defaultImage;
extern NSMutableArray * SearchArray;//搜索历史
//API
extern NSString *const API_query;//http://apis.juhe.cn/cook/query.php
//查看菜谱的所有分类，如菜系、口味等
extern NSString *const API_category; //http://apis.juhe.cn/cook/category
//按标签检索菜谱
extern NSString *const API_queryByTag;//http://apis.juhe.cn/cook/index
//按菜谱ID查看详细
extern NSString *const API_queryByID;//http://apis.juhe.cn/cook/queryid
extern NSString *const MenuFirstViewControllerNotification;
extern NSString *const MenuLucyViewControllerNotification;
extern CGFloat  const TabViewControllerTabBarWidth;
extern CGFloat  const MarkCollectionItemWidth;
extern CGFloat  const DetailTableViewHeaderViewHeight;
extern CGFloat  const MenuFirstViewHeaderViewHeight;
extern CGFloat  const MenuFirstViewHeaderloopViewHeight;
extern CGFloat  const MenuFirstViewHeaderScrollViewHeight;
extern CGFloat  const MenuFirstViewFooterViewHeight;
extern NSString *const MenuLeftReuseIdentifier;
extern NSString *const InfoCollectionreuseIdentifier;
extern NSString *const StepViewreuseIdentifier;
extern NSString *const BurViewreuseIdentifier;
extern NSString *const FirstVarietyMenuIdentifier;
extern NSString *const SecondVarietyMenuIdentifier;
extern NSString *const VarietyDetailCollectionViewIdentifier;
extern NSString *const MarkCollectionViewIdentifier;
#define ALERT_MESSAGE(msg) {\
MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo: [UIApplication sharedApplication].keyWindow animated:YES];\
hud.mode=MBProgressHUDModeText;\
hud.labelText=msg;\
hud.removeFromSuperViewOnHide=YES;\
[hud hide:YES afterDelay:1];\
}
@interface MenuConst : NSObject

@end
