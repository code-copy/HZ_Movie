//
//  CommentCell.m
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    
    _userImage.layer.cornerRadius = 5.0;
    _userImage.layer.masksToBounds = YES;
    
    _bgView.layer.cornerRadius = 5.0;
    _bgView.layer.masksToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_userImage sd_setImageWithURL:[NSURL URLWithString:_model.userImage]];
    
    _nikeName.text = _model.nickname;
    
    _ratingLabel.text = _model.rating;
    
    _contentLabel.text = _model.content;
    
    //sizeToFit label自适应文本尺寸
    [_contentLabel sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
