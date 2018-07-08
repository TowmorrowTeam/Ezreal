//
//  RealmTool.m
//  notepad
//
//  Created by Zhang Liqiang on 2018/7/7.
//  Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import "RealmTool.h"

@implementation RealmTool

+ (void)addObjecttoRealm:(Bill *)bill
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:bill];
    [realm commitWriteTransaction];
}

+ (void)deleteObjecttoRealm:(Bill *)bill
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObject:bill];
    }];
}

+ (void)modifyObjecttoRealm:(Bill *)bill
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:bill];
    }];
}

+ (RLMResults *)getAllBills
{
    RLMResults *results = [Bill allObjects];
    return results;
}

+ (NSMutableDictionary *)finalResultOfAllBills
{
    RLMResults *results = [self getAllBills];
    NSMutableDictionary *dicM = [self finalResultMoneyOfResults:results];
    return dicM;
}

+ (RLMResults *)getAllBillsOfCurrentDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *nowDateStr = [dateFormatter stringFromDate:[NSDate date]];
    nowDateStr = [nowDateStr stringByAppendingString:@"000000"];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *startDate = [dateFormatter dateFromString:nowDateStr];
    NSTimeInterval time = [startDate timeIntervalSince1970];
    
    RLMResults *results = [Bill objectsWhere:[NSString stringWithFormat:@"date > %f", time]];
    
    return results;
}

+ (NSMutableDictionary *)finalResultOfAllBillsOfCurrentDay
{
    RLMResults *results = [self getAllBillsOfCurrentDay];
    return [self finalResultMoneyOfResults:results];
}

+ (RLMResults *)getAllBillsOfSelectMonth:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    NSString *firstDataStr = [dateFormatter stringFromDate:date];
    int month = [[firstDataStr substringFromIndex:4] intValue];
    int year = [[firstDataStr substringToIndex:4] intValue];
    if (month == 12) {
        month = 1;
        year += 1;
    } else {
        month += 1;
    }
    NSString *endDateStr = [NSString stringWithFormat:@"%d%02d", year, month];
   
    firstDataStr = [firstDataStr stringByAppendingString:@"01000000"];
    endDateStr = [endDateStr stringByAppendingString:@"01000000"];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *startDate = [dateFormatter dateFromString:firstDataStr];
    NSDate *endDate = [dateFormatter dateFromString:endDateStr];
    NSTimeInterval startTime = [startDate timeIntervalSince1970];
    NSTimeInterval endTime = [endDate timeIntervalSince1970];
    
    RLMResults *results = [Bill objectsWhere:[NSString stringWithFormat:@"date > %f AND date < %f", startTime, endTime]];
    
    return results;
}

+ (NSMutableDictionary *)finalResultOfAllBillsOfSelectMonth:(NSDate *)date
{
    RLMResults *results = [self getAllBillsOfSelectMonth:date];
    return [self finalResultMoneyOfResults:results];
}

+ (NSMutableDictionary *)finalResultMoneyOfResults:(RLMResults *)results
{
    RLMResults *incomes = [results objectsWhere:@"type = '1'"];
    RLMResults *pays = [results objectsWhere:@"type = '2'"];
    double incomeMoney = 0, payMoney = 0, resultMoney = 0;
    for (Bill *bill in incomes) {
        incomeMoney += [bill.money doubleValue];
    }
    for (Bill *bill in pays) {
        payMoney += [bill.money doubleValue];
    }
    resultMoney = incomeMoney - payMoney;
    
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setValue:[NSString stringWithFormat:@"%.2f", incomeMoney] forKey:__INCOMEMONEY];
    [dicM setValue:[NSString stringWithFormat:@"%.2f", payMoney] forKey:__PAYMONEY];
    [dicM setValue:[NSString stringWithFormat:@"%.2f", resultMoney] forKey:__RESULTMONEY];
    
    return dicM;
}

@end
