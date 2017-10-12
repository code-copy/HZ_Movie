//
//  TopCell.h
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-22.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"
#import "TopModel.h"

@interface TopCell : UICollectionViewCell

{
    IBOutlet UIImageView *_topImageVIew;
    IBOutlet UILabel *_movieTitle;
    IBOutlet RatingView *_ratingView;
    IBOutlet UILabel *_ratingLabel;
    
}

@property (nonatomic, strong)TopModel *model;



@end
