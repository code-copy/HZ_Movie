//
//  CommentCell.h
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCommentModel.h"

@interface CommentCell : UITableViewCell
{
    IBOutlet UIImageView *_userImage;
    IBOutlet UIView *_bgView;
    IBOutlet UILabel *_nikeName;
    IBOutlet UILabel *_contentLabel;
    IBOutlet UILabel *_ratingLabel;
}

@property(nonatomic, strong)MovieCommentModel *model;

@end
