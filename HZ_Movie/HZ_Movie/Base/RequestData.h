//
//  RequestData.h
//  HZ_Movie
//
//  Created by king_linfu on 15-1-31.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestData : NSObject

/**
 *  解析JSON文件
 *
 *  @param fileName JSON文件名称
 *
 *  @return 解析后的数据
 */
+ (id)loadMovieDataWithJSON:(NSString *)fileName;

@end
