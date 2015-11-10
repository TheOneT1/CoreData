//
//  PersonEntity.h
//  CoreData操作
//
//  Created by yyl on 15/11/9.
//  Copyright (c) 2015年 fssj. All rights reserved.
//

#import <CoreData/CoreData.h>
@class CardEntity;
@interface PersonEntity : NSManagedObject
@property (nonatomic,retain)NSString *name;
@property (nonatomic,retain)NSString *age;
@property (nonatomic,retain)CardEntity *card;
@end
