//
//  Bill.h
//  notepad
//
//  Created by Zhang Liqiang on 2018/7/7.
//Copyright © 2018年 Zhang Liqiang. All rights reserved.
//

#import <Realm/Realm.h>

@interface Bill : RLMObject

@property NSString *moduleId;            //序号
@property NSString *type;                //类型(收入/支出)
@property NSString *date;                //时间
@property NSString *detailDescription;   //描述
@property NSString *money;               //金额

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Bill *><Bill>
RLM_ARRAY_TYPE(Bill)
