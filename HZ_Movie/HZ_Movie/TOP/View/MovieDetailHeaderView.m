//
//  MoviewDetailHeaderView.m
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "MovieDetailHeaderView.h"

@implementation MovieDetailHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _scrollView.layer.cornerRadius = 5.0;
    _scrollView.layer.borderColor = [[UIColor whiteColor] CGColor];
    _scrollView.layer.borderWidth = 1.0;
    _scrollView.layer.masksToBounds = YES;
}


- (void)setModel:(MovieDetailModel *)model
{
    _model = model;
    [self creatImageViews];
    [self loadViewData];
}

- (void)creatImageViews
{
    NSInteger count = _model.images.count;
    
    _scrollView.contentSize = CGSizeMake(80 * count + 5, 80);
    
    for (int i = 0; i<count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5 + i *80, 2, 75, 75)];
        
        imageView.layer.cornerRadius = 5.0;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.masksToBounds = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:_model.images[i]]];
        
        [_scrollView addSubview:imageView];
    }
}

- (void)loadViewData
{
    [_movieImage sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    _movieTitle.text = _model.titleCn;
    
    //componentsJoinedByString 将数组元素以某个字符串，拼接成新的字符串
    NSString *directorStr = [_model.directors componentsJoinedByString:@"、"];
    _directName.text = [NSString stringWithFormat:@"导演：%@", directorStr];
    
    NSString *actorStr = [_model.actors componentsJoinedByString:@"、"];
    _actorName.text = [NSString stringWithFormat:@"主演：%@", actorStr];
    
    NSString *typeStr = [_model.type componentsJoinedByString:@"、"];
    _movieType.text = [NSString stringWithFormat:@"导演：%@", typeStr];
    
    
    NSString *location = [_model.m_release objectForKey:@"location"];
    NSString *date = [_model.m_release objectForKey:@"date"];
    _movieYear.text = [NSString stringWithFormat:@"%@、%@",location, date];
    
}


@end
