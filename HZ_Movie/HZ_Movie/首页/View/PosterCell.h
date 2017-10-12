//
//  PosterCell.h
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface PosterCell : UICollectionViewCell

@property (nonatomic, strong)MovieModel *model;

/**
 *  视图的翻转
 */
- (void)filpViews;

/**
 *  视图复位
 */
- (void)exchangeView;

@end
