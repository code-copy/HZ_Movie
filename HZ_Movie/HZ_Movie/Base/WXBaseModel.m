//
//  WXBaseModel.m
//  WXMove_demo
//
//  Created by king_linfu on 14-11-18.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "WXBaseModel.h"

@implementation WXBaseModel

- (id)initJsonModelWithDictionary:(NSDictionary *)jsonDic
{
    self = [super init];
    if (self != nil) {

        [self setAttributes:jsonDic];
    }
    
    return self;
}

- (NSDictionary *)jsonKeyMapDictionary:(NSDictionary *)jsonDic
{
    NSMutableDictionary *mapDic = [[NSMutableDictionary alloc] init];
    for (id jsonKey in jsonDic) {
        
        // 将json的key，作为字典的key 和 value
        [mapDic setObject:jsonKey forKey:jsonKey];
    }
    
    return mapDic;
}

- (void)setAttributes:(NSDictionary *)jsonDic
{
    NSDictionary *mapDic = [self jsonKeyMapDictionary:jsonDic];
    
    for (NSString *key in mapDic) {
        
        NSString *dicValue = [mapDic objectForKey:key];
        
        SEL attSEL = [self fromStringToSEL:dicValue];
        
        if ([self respondsToSelector:attSEL]) {
            // 获取json中key 对应的值
            id attValue = [jsonDic objectForKey:key];
            // 校验，对NSNull类型数据做处理
            if ([attValue isKindOfClass:[NSNull class]]) {
                
                attValue = @"";
            }
            
            // 调用set方法，并设值
            [self performSelector:attSEL withObject:attValue];
        }
    }

}


- (SEL)fromStringToSEL:(NSString *)attName
{
    // 截取首字母并将它转为大写
    NSString *firstStr = [[attName substringToIndex:1] uppercaseString];
    
    // 截取首字母后的字符串都保存原来的不变
    NSString *otherStr = [attName substringFromIndex:1];
    
    // 拼接成set方法的字符串形式
    NSString *SELString = [NSString stringWithFormat:@"set%@%@:",firstStr,otherStr];
    
    // 将字符串转为方法: NSSelectorFromString();
    SEL attributeSEL = NSSelectorFromString(SELString);
    
    return attributeSEL;
}

@end
