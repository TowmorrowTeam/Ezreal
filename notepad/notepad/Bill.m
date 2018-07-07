//
//  Bill.m
//  notepad
//
//  Created by Zhang Liqiang on 2018/7/7.
//Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import "Bill.h"

@implementation Bill

//主键
+ (NSString *)primaryKey {
    return @"moduleId";
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
