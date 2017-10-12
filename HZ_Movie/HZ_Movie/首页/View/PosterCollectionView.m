//
//  PosterCollectionView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"

static NSString *indentify = @"posterCell";

@implementation PosterCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:indentify];
    }
    
    return self;
}


#pragma mark - <UICollectionViewDataSource>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath];
    cell.model = self.movieModelArray[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取指定位置的cell：cellForItemAtIndexPath
    if (indexPath.item == self.currentPage) {
        PosterCell *cell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell filpViews];
        
    } else {
        
        // 设置滚动到当前页的偏移量
        [UIView animateWithDuration:0.5 animations:^{
            
            collectionView.contentOffset = CGPointMake((self.itemWidth + self.minLineSpace) * indexPath.item, 0);
            
        } completion:^(BOOL finished) {
            
            self.currentPage = indexPath.item;
        }];
        
    }
}

// cell结束显示时，海报页复位
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCell *posterCell = (PosterCell *)cell;
    [posterCell exchangeView];
}

@end
