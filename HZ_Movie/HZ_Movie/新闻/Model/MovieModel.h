//
//  MovieModel.h
//  HZ_Movie
//
//  Created by king_linfu on 15-1-30.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

/*
 "rating": {￼
    "max": 10,
    "average": 7.1,
    "stars": "35",
    "min": 0
 },
 
 "title": "美国狙击手",
 "original_title": "American Sniper",
 "year": "2014",
 "images": {￼
    "small": "http://img3.douban.com/view/movie_poster_cover/ipst/public/p2203481530.jpg",
    "large": "http://img3.douban.com/view/movie_poster_cover/lpst/public/p2203481530.jpg",
    "medium": "http://img3.douban.com/view/movie_poster_cover/spst/public/p2203481530.jpg"
 },

 */

@property (strong, nonatomic)NSDictionary *rating; // 电影评分
@property (strong, nonatomic)NSString *title; // 电影标题
@property (strong, nonatomic)NSString *original_title; // 电影原名
@property (strong, nonatomic)NSString *year;
@property (strong, nonatomic)NSDictionary *images;

@end
