//
//  MovieDetailModel.h
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "WXBaseModel.h"

@interface MovieDetailModel : WXBaseModel

/*
 "image" : "http://img31.mtime.cn/mt/2012/06/28/131128.94272291.jpg",
 "titleCn" : "摩尔庄园2海妖宝藏",
 "titleEn" : "Legend of The Moles-Treasure of Scylla",
 "rating" : "7.7",
 "year" : "2012",

 "type" : [ "动画", "动作", "奇幻", "冒险" ],
 "directors" : [ "刘可欣" ],
 "actors" : ["阿黄","阿龟","阿宇","阿红","凤姐"],
 "release" : {
        "location" : "中国",
        "date" : "2012-7-5"
	},
 
 "images" : [ "http://img31.mtime.cn/pi/2012/06/14/193026.85486289.jpg",
 "http://img31.mtime.cn/pi/2012/06/14/193028.65049217.jpg",
 "http://img31.mtime.cn/pi/2012/06/14/193029.38103098.jpg",
 "http://img31.mtime.cn/pi/2012/06/14/193030.29253345.jpg",
 "http://img21.mtime.cn/mg/2012/04/23/212649.32521220.jpg",
 "http://img31.mtime.cn/mg/2012/06/21/112031.62936983.jpg"],
 */

@property(nonatomic, copy)NSString *image;
@property(nonatomic, copy)NSString *titleCn;
@property(nonatomic, copy)NSString *titleEn;
@property(nonatomic, copy)NSString *year;
@property(nonatomic, strong)NSArray *type;
@property(nonatomic, strong)NSArray *directors;
@property(nonatomic, strong)NSArray *actors;
@property(nonatomic, strong)NSDictionary *m_release;
@property(nonatomic, strong)NSArray *images;

@end
