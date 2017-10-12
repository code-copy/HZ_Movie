//
//  MoviewDetailHeaderView.h
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"

@interface MovieDetailHeaderView : UIView
{
    IBOutlet UIImageView *_movieImage;
    IBOutlet UILabel *_movieTitle;
    IBOutlet UILabel *_movieYear;
    IBOutlet UILabel *_actorName;
    IBOutlet UILabel *_movieType;
    IBOutlet UILabel *_directName;
    IBOutlet UIScrollView *_scrollView;
}

@property(nonatomic, strong)MovieDetailModel *model;

@end
