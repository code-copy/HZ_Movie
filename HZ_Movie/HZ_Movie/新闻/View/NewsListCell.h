//
//  NewsListCell.h
//  HZ_Movie
//
//  Created by king_linfu on 15-1-31.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsListCell : UITableViewCell
{
    IBOutlet UIImageView *_newsImage;
    IBOutlet UILabel *_newsTitle;
    IBOutlet UILabel *_subTitle;
    IBOutlet UIImageView *_markView;
}

@property (nonatomic, strong)NewsModel *model;

@end
