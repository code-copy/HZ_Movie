//
//  DistrictModel.h
//  WXMove_demo
//
//  Created by king_linfu on 14-11-24.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "WXBaseModel.h"

@interface DistrictModel : WXBaseModel

/*
 
 {
 "name" : "东城区",
 "id" : "1029"
 },
 
 */

@property (copy, nonatomic)NSString *name; // 市区名称
@property (copy, nonatomic)NSString *districtID; // 市区ID

@end
