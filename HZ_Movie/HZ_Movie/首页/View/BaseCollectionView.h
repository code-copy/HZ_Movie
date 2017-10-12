//
//  BaseCollectionView.h
//  HZ_Movie
//
//  Created by king_linfu on 15-2-4.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)NSArray *movieModelArray;
@property (nonatomic, assign)NSInteger currentPage;
@property (nonatomic, assign)float itemWidth; // item 宽度
@property (nonatomic, assign)float minLineSpace; // item最小间距

@end
