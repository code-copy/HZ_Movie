//
//  MovieListCell.h
//  HZ_Movie
//
//  Created by king_linfu on 15-1-30.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "RatingView.h"

@interface MovieListCell : UITableViewCell
{
    IBOutlet UIImageView *_movieImage;
    IBOutlet UILabel *_movieTitle;
    IBOutlet RatingView *_ratingView;
    IBOutlet UILabel *_yearLabel;
    IBOutlet UILabel *_ratingLabel;
}

@property (nonatomic, strong)MovieModel *model;

@end
