//
//  WXBaseModel.h
//  WXMove_demo
//
//  Created by king_linfu on 14-11-18.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXBaseModel : NSObject

/**
 *  初始化的时候讲字典传入
 *
 *  @param jsonDic 解析后的JSON
 *
 *  @return self
 */
- (id)initJsonModelWithDictionary:(NSDictionary *)jsonDic;


/**
 *  解析后的JSON字典的健与字典映射，及将json的所以健保存
 *
 *  @param jsonDic 解析后的JSON字典
 *
 *  @return 映射后的字典
 */
- (NSDictionary *)jsonKeyMapDictionary:(NSDictionary *)jsonDic;


/**
 *  给属性设置设置值
 *
 *  @param mapDic 映射后的字典
 */
- (void)setAttributes:(NSDictionary *)jsonDic;


@end
