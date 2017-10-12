//
//  CinemaModel.m
//  WXMove_demo
//
//  Created by king_linfu on 14-11-23.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel

- (void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    
    self.cinemaId = [jsonDic objectForKey:@"id"];
}

@end
