//
//  PosterDetailView.h
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"
#import "MovieModel.h"

@interface PosterDetailView : UIView
{
    IBOutlet UIImageView *_movieImage;
    IBOutlet UILabel *_cnTitle;
    IBOutlet UILabel *_enTitle;
    IBOutlet UILabel *_year;
    IBOutlet UILabel *_rating;
    IBOutlet RatingView *_ratingView;
}

@property (nonatomic, strong)MovieModel *model;

@end
