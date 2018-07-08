//
//  RealmTool.m
//  notepad
//
//  Created by Zhang Liqiang on 2018/7/7.
//  Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import "RealmTool.h"

@implementation RealmTool

+ (void)addObjecttoRealm:(RLMObject *)realmObject
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+ (void)deleteObjecttoRealm:(RLMObject *)realmObject
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObject:realmObject];
    }];
}

+ (void)modifyObjecttoRealm:(RLMObject *)realmObject
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:realmObject];
    }];
}

@end
