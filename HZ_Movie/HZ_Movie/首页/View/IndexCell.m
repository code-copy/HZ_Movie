//
//  IndexCell.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "IndexCell.h"

@implementation IndexCell
{
    UIImageView *_imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _initViews];
    }
    
    return self;
}

- (void)_initViews
{
    _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    _imageView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_imageView];
}

- (void)setModel:(MovieModel *)model
{
    _model = model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[_model.images objectForKey:@"large"]]];
}

@end
