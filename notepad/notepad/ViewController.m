//
//  ViewController.m
//  notepad
//
//  Created by Zhang Liqiang on 2018/6/22.
//  Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import "ViewController.h"
#import "RealmTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
//    NSTimeInterval time = 1499335685;
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
//    NSDate *nowDate = [NSDate date];
//    NSTimeInterval time = [nowDate timeIntervalSince1970];
//
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////    [dateFormatter setDateFormat:@"yyyyMMdd"];
////    //    NSString *nextDateStr = [dateFormatter stringFromDate:nextDate];
//    NSString *nowDateStr = [dateFormatter stringFromDate:[NSDate date]];
////
////    nowDateStr = [nowDateStr stringByAppendingString:@"000000"];
//    nowDateStr = @"20180601100805";
//    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
//    NSDate *date = [dateFormatter dateFromString:nowDateStr];
//    NSTimeInterval time = [date timeIntervalSince1970];
////
////    double times = 0.005;
////    NSLog(@"%f", times);
////
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    
//    NSTimeInterval firstTime = 1527847685;
//    NSDate *firstDate = [NSDate dateWithTimeIntervalSince1970:firstTime];
//    NSTimeInterval intervalTime = 5*24*60*60;
//    NSDate *nextDate;
//    NSTimeInterval nextTime;
//    for (int i = 0; i < 7; i++) {
//        Bill *bill = [[Bill alloc] init];
//        bill.moduleId = [NSString stringWithFormat:@"%d", i + 2];
//        bill.detailDescription = [NSString stringWithFormat:@"花费%d", i + 1];
//        bill.type = [NSString stringWithFormat:@"%d", (i%2 + 1)];
//        bill.money = [NSString stringWithFormat:@"%d", (i+1) * 1000];
//
//
//        nextDate = [NSDate dateWithTimeInterval:intervalTime sinceDate:firstDate];
//        firstDate = nextDate;
//        nextTime = [nextDate timeIntervalSince1970];
//        bill.date = nextTime;
//
//        [RealmTool addObjecttoRealm:bill];
//    }
    
//    RLMResults *results1 = [RealmTool getAllBills];
//    
//    RLMResults *results2 = [RealmTool getAllBillsOfCurrentDay];
//    
//    RLMResults *results3 = [RealmTool getAllBillsOfSelectMonth:[NSDate date]];
    
    NSMutableDictionary *dicM1 = [RealmTool finalResultOfAllBills];
    NSMutableDictionary *dicM2 = [RealmTool finalResultOfAllBillsOfCurrentDay];
    NSMutableDictionary *dicM3 = [RealmTool finalResultOfAllBillsOfSelectMonth:[NSDate date]];
    
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm addOrUpdateObject:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
