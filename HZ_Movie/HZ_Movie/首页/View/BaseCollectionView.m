//
//  BaseCollectionView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-4.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (id)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator = NO;
    }
    
    return self;
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _movieModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark - <UICollectionViewDelegateFlowLayout>
// 设置item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_itemWidth,CGRectGetHeight(self.frame));
}

// 设置最小的item间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return _minLineSpace;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth) / 2, 0, (kScreenWidth - _itemWidth) / 2);
}

// 停止拖拽的时候调用,可获得偏移量
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // 获取x方向的偏移量
    float xOffSet = targetContentOffset->x;
    NSInteger index = (xOffSet + ((_itemWidth + _minLineSpace) / 2)) / (_itemWidth + _minLineSpace);
    targetContentOffset->x = index *(_itemWidth + _minLineSpace);
    
    self.currentPage = index;
}

@end
