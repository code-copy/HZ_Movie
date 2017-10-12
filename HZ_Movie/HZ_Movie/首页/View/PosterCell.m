//
//  PosterCell.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "PosterCell.h"
#import "PosterDetailView.h"

@implementation PosterCell
{
    UIImageView *_imageView;
    PosterDetailView *_detailView;
    BOOL _isDown;
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
    _detailView = [[[NSBundle mainBundle] loadNibNamed:@"PosterDetailView" owner:self options:nil] lastObject];
    _detailView.frame = self.contentView.bounds;
    _detailView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self.contentView addSubview:_detailView];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    _imageView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_imageView];
    
}

- (void)filpViews
{
    UIViewAnimationOptions option = _isDown ? UIViewAnimationOptionTransitionCurlDown : UIViewAnimationOptionTransitionCurlUp;
    
    [UIView transitionWithView:self.contentView duration:0.5 options:option animations:^{
        
        // 获取子视图所在父视图的位置
        NSArray *subViews = [self.contentView subviews];
        NSInteger index1 = [subViews indexOfObject:_imageView];
        NSInteger index2 = [subViews indexOfObject:_detailView];
        
        // 交换两个子视图的位置
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        
    } completion:^(BOOL finished) {
        
        _isDown = !_isDown;
    }];
}

- (void)exchangeView
{
    [self.contentView bringSubviewToFront:_imageView];
    if (_isDown) {
        
        _isDown = !_isDown;
    }
}


- (void)setModel:(MovieModel *)model
{
    _model = model;
    _detailView.model = _model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[_model.images objectForKey:@"large"]]];
}

@end
