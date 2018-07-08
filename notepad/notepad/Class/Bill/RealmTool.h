//
//  RealmTool.h
//  notepad
//
//  Created by Zhang Liqiang on 2018/7/7.
//  Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealmTool : NSObject

// 添加
+ (void)addObjecttoRealm:(RLMObject *)realmObject;

// 删除
+ (void)deleteObjecttoRealm:(RLMObject *)realmObject;

// 修改
+ (void)modifyObjecttoRealm:(RLMObject *)realmObject;

@end
