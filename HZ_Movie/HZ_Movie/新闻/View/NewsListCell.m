//
//  NewsListCell.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-31.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    _newsTitle.text = _model.title;
    
    _subTitle.text = _model.summary;
    
    if ([_model.type intValue] == 0) {
        
        _markView.hidden = YES;

    }else if([_model.type intValue] == 1) {
        
        _markView.hidden = NO;
        [_markView setImage:[UIImage imageNamed:@"sctpxw"]];
        
    }else if([_model.type intValue] == 2) {
        
        _markView.hidden = NO;
        [_markView setImage:[UIImage imageNamed:@"scspxw"]];
    }
}

@end
