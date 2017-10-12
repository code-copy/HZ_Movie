//
//  ImageScanCell.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-2.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "ImageScanCell.h"

@implementation ImageScanCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[ImageScanScrollView alloc] initWithFrame:self.contentView.bounds];
        
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void)setImageURL:(NSString *)imageURL
{
    _imageURL = imageURL;
    _scrollView.imageURL = _imageURL;
}

@end
