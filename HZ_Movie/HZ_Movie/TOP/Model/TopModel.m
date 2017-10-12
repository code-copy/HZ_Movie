//
//  TopModel.m
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-22.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "TopModel.h"

@implementation TopModel

- (void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    
    self.movieID = [jsonDic objectForKey:@"id"];
}

@end
