//
//  RatingView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-30.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView
{
    UIView *_grayView;
    UIView *_yellowView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _initRatingViews];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self _initRatingViews];
}


- (void)_initRatingViews
{
    self.backgroundColor = [UIColor clearColor];
    
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    
    float imageWidth = grayImage.size.width;
    float imageHeight = grayImage.size.height;
    //1、添加灰色星星视图
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageWidth * 5, imageHeight)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    [self addSubview:_grayView];
    
    //2、添加金色星星视图
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageWidth * 5, imageHeight)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    
    [self addSubview:_yellowView];
    
    // 4、调整星星的大小
    // 放大的倍数
    float scale = self.height / imageHeight;
    CGAffineTransform newForm = CGAffineTransformMakeScale(scale, scale);
    
    _grayView.transform = newForm;
    _yellowView.transform = newForm;
    
    _grayView.origin = CGPointMake(0, 0);
    _yellowView.origin = CGPointMake(0, 0);
    
    self.width = _grayView.width;
}


- (void)setRating:(float)rating
{
    _rating = rating;
    //3、根据评分改变金色星星视图的宽度
    _yellowView.width = _rating / 10 * _grayView.width;
}

@end
