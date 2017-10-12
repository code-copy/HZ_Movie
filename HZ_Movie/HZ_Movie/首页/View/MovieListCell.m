//
//  MovieListCell.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-30.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "MovieListCell.h"

@implementation MovieListCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _movieTitle.text = _model.title;
    

    _ratingLabel.text = [NSString stringWithFormat:@"%.1f", [[_model.rating objectForKey:@"average"] floatValue]];
    
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",_model.year];
    
    NSString *imageURLStr = [_model.images objectForKey:@"medium"];
    NSURL *imageURL = [[NSURL alloc] initWithString:imageURLStr];
    
    // 加载网络图片，使用第三方框架：SDWebImage
    [_movieImage sd_setImageWithURL:imageURL];
    
    _ratingView.rating = [[_model.rating objectForKey:@"average"] floatValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
