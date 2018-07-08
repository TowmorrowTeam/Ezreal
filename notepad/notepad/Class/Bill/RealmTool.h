//
//  RealmTool.h
//  notepad
//
//  Created by Zhang Liqiang on 2018/7/7.
//  Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import "Bill.h"

#define __INCOMEMONEY   @"INCOMEMONEY"
#define __PAYMONEY      @"PAYMONEY"
#define __RESULTMONEY   @"RESULTMONEY"

@interface RealmTool : Bill

// 添加
+ (void)addObjecttoRealm:(Bill *)bill;

// 删除
+ (void)deleteObjecttoRealm:(Bill *)bill;

// 修改
+ (void)modifyObjecttoRealm:(Bill *)bill;

// 查询所有数据
+ (RLMResults *)getAllBills;

// 查询当天所有数据
+ (RLMResults *)getAllBillsOfCurrentDay;

// 查询任一月的所有数据
+ (RLMResults *)getAllBillsOfSelectMonth:(NSDate *)date;

// 根据查询的结果获取 总收入、总支出、总收益
+ (NSMutableDictionary *)finalResultMoneyOfResults:(RLMResults *)results;

// 总收入/支出
+ (NSMutableDictionary *)finalResultOfAllBills;

// 当天总收入/支出
+ (NSMutableDictionary *)finalResultOfAllBillsOfCurrentDay;

// 任一月总收入/支出
+ (NSMutableDictionary *)finalResultOfAllBillsOfSelectMonth:(NSDate *)date;

@end
