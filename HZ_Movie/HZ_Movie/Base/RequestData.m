//
//  RequestData.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-31.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "RequestData.h"

@implementation RequestData

+ (id)loadMovieDataWithJSON:(NSString *)fileName
{
    // 1、找到文件存放路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    // 2、获取文件的内容
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    // 3、JSON数据解析:NSJSONSerialization 官方提供的JSON解析方法
    id jsonDic =  [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return jsonDic;
}

@end
