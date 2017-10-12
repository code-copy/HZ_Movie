//
//  IndexCollectionView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCell.h"

static NSString *indentify = @"indexCell";

@implementation IndexCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:indentify];
    }
    
    return self;
}


#pragma mark - <UICollectionViewDataSource>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath];
    cell.model = self.movieModelArray[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取指定位置的cell：cellForItemAtIndexPath
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.currentPage = indexPath.item;
}

@end
