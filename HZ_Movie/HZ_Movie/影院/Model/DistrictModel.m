//
//  DistrictModel.m
//  WXMove_demo
//
//  Created by king_linfu on 14-11-24.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "DistrictModel.h"

@implementation DistrictModel

- (void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    
    self.districtID = [jsonDic objectForKey:@"id"];
}

@end
