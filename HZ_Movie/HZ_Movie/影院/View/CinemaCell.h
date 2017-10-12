//
//  CinemaCell.h
//  WXMove_demo
//
//  Created by king_linfu on 14-11-23.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell
{
    IBOutlet UILabel *_cinemaName; // 影院名称
    IBOutlet UILabel *_cinameRating; // 影院评分
    IBOutlet UILabel *_cinemaAddress; //影院地址
    IBOutlet UILabel *_lowerPrice; // 最低价格
    IBOutlet UILabel *_distance; // 距离
    IBOutlet UIImageView *z_image; // 座位图标
    IBOutlet UIImageView *q_image; // 优惠券图标
}

@property(strong, nonatomic)CinemaModel *model; // 电影数据

@end
