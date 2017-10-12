//
//  ImageScanScrollView.h
//  HZ_Movie
//
//  Created by king_linfu on 15-2-2.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScanScrollView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, strong)NSString *imageURL;
@property (nonatomic, strong)UIImageView *imageView;

@end
