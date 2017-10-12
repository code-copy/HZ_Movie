//
//  MovieCommentModel.h
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "WXBaseModel.h"

@interface MovieCommentModel : WXBaseModel

/*
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content" : "儿子很喜欢 一直期盼上映"
 
 */

@property(nonatomic, copy)NSString *userImage;
@property(nonatomic, copy)NSString *nickname;
@property(nonatomic, copy)NSString *rating;
@property(nonatomic, copy)NSString *content;


@end
