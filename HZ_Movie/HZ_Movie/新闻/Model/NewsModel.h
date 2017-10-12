//
//  NewsModel.h
//  HZ_Movie
//
//  Created by king_linfu on 15-1-31.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

/*
 {
 "id" : 1491532,
 "type" : 1,
 "image" : "http://img31.mtime.cn/mg/2012/06/28/104511.59257202.jpg",
 "title" : "汤姆·克鲁斯新片首曝造型",
 "summary" : "汤姆·克鲁斯,杰克·理查尔,剧照"
 },
 
 */

@property (nonatomic, strong)NSNumber *type; // 新闻类型
@property (nonatomic, strong)NSString *image; // 新闻缩略图
@property (nonatomic, strong)NSString *title; // 新闻标题
@property (nonatomic, strong)NSString *summary; // 新闻简介

@end
