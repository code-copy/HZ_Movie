//
//  PosterDetailView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "PosterDetailView.h"

@implementation PosterDetailView

- (void)setModel:(MovieModel *)model
{
    _model = model;
    
    _cnTitle.text = [NSString stringWithFormat:@"中文名：%@",_model.title];
    
    _enTitle.text = [NSString stringWithFormat:@"英文名：%@",_model.original_title];

    _year.text = [NSString stringWithFormat:@"年份：%@",_model.year];
    
    float rating = [[_model.rating objectForKey:@"average"] floatValue];
    _rating.text = [NSString stringWithFormat:@"%.1f",rating];
    _ratingView.rating = rating;
    
    [_movieImage sd_setImageWithURL:[NSURL URLWithString:[_model.images objectForKey:@"medium"]]];
}

@end
