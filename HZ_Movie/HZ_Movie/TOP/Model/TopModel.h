//
//  TopModel.h
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-22.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXBaseModel.h"

@interface TopModel : WXBaseModel

/*
 {
 "rating": {
 "max": 10,
 "average": 9.6,
 "stars": "50",
 "min": 0
 },
 
 "title": "肖申克的救赎",
 "images": {
 "small": "http://img3.douban.com/view/movie_poster_cover/ipst/public/p480747492.jpg",
 "large": "http://img3.douban.com/view/movie_poster_cover/lpst/public/p480747492.jpg",
 "medium": "http://img3.douban.com/view/movie_poster_cover/spst/public/p480747492.jpg"
 },
 
 "id": "1292052"

 
 */
@property (nonatomic, strong)NSDictionary *rating;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSDictionary *images;

@property (nonatomic, strong)NSString *movieID;


@end
