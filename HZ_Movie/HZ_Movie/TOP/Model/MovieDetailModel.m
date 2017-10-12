//
//  MovieDetailModel.m
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

- (void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    
    self.m_release = [jsonDic objectForKey:@"release"];
}

@end
