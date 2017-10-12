//
//  ImageListCell.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-2.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "ImageListCell.h"

@implementation ImageListCell


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // UICollectionViewCell 去加载数据，不能在这个方法里填充数据
}


- (void)awakeFromNib
{
    _imageListView.layer.cornerRadius = 5;
    _imageListView.layer.borderColor = [[UIColor whiteColor] CGColor];
    _imageListView.layer.borderWidth = 1;
    _imageListView.contentMode = UIViewContentModeScaleAspectFill;
    _imageListView.layer.masksToBounds = YES;
}

- (void)setModel:(ImageModel *)model
{
    _model = model;
    [_imageListView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
}

@end
