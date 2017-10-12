//
//  ImageScanScrollView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-2.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "ImageScanScrollView.h"

@implementation ImageScanScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
        self.delegate = self;
        
        UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwoAction)];
        
        tapTwo.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tapTwo];
        
        UITapGestureRecognizer *tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneAction)];
        [self addGestureRecognizer:tapOne];
        
        // requireGestureRecognizerToFail 解决两个手势的冲突
        [tapOne requireGestureRecognizerToFail:tapTwo];
    }
    
    return self;
}

- (void)setImageURL:(NSString *)imageURL
{
    _imageURL = imageURL;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageURL]];
}

#pragma mark - Actions
- (void)tapOneAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenNavBar" object:nil];
}

- (void)tapTwoAction
{
    if (self.zoomScale > 1.0) {
        
        [self setZoomScale:1.0 animated:YES];
        
    } else {
        
        [self setZoomScale:2.0 animated:YES];
    }
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
