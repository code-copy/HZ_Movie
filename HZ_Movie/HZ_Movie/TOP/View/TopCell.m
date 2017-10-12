//
//  TopCell.m
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-22.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

- (void)awakeFromNib {
    
    [_movieTitle setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
}

- (void)setModel:(TopModel *)model
{
    _model = model;
    
    NSURL *imageUrl = [NSURL URLWithString:[_model.images objectForKey:@"medium"]];
    [_topImageVIew sd_setImageWithURL:imageUrl];
    
    _movieTitle.text = _model.title;
    
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",[[_model.rating objectForKey:@"average"] floatValue]];
    
    NSString  *ratingValue = [NSString stringWithFormat:@"%.1f", [[_model.rating objectForKey:@"average"] floatValue] ];
    _ratingView.rating = [ratingValue floatValue];
}

@end
