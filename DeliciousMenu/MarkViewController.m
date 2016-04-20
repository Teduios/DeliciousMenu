//
//  MarkViewController.m
//  DeliciousMenu
//
//  Created by hgy on 16/3/22.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "MarkViewController.h"
#import "MenuHomeViewController.h"
#import "DetailTableViewController.h"
#import "MarkCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "PingInvertTransition.h"

@interface MarkViewController ()
@end
static NSString *const ID = @"image";
@implementation MarkViewController

- (id)init{
    self= [super initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    
    return self;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"iconfont-fanhui"highImage:@"iconfont-fanhui"];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.delegate = self;
    self.title = @"收藏";
    [self setCollection];

}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

//转场设置
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        if ([toVC isKindOfClass:[MenuHomeViewController class]]) {
            PingInvertTransition *ping = [PingInvertTransition new];
            return ping;
        }
        else{
            
            return nil;
        }
        
        
        
    }
    else{
        return nil;
    }
    
}


#pragma mark - Collection相关
- (void)setCollection{
 
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:MarkCollectionViewIdentifier bundle:nil] forCellWithReuseIdentifier:MarkCollectionViewIdentifier];
   
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return favModels.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat margin  = 15;
    CGFloat width = (self.view.width - 3 * margin) / 2;
    return CGSizeMake(width,width * 1.3);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     MarkCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MarkCollectionViewIdentifier forIndexPath:indexPath];
    infoModel * model=(infoModel*)[favModels objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    DetailTableViewController *vc=[[DetailTableViewController alloc]initWithInfoModel:(infoModel *)[favModels objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];

}






@end
