//
//  CardEntity.h
//  CoreData操作
//
//  Created by yyl on 15/11/9.
//  Copyright (c) 2015年 fssj. All rights reserved.
//

#import <CoreData/CoreData.h>
@class PersonEntity;
@interface CardEntity : NSManagedObject
@property(nonatomic,retain)NSString *no;
@property(nonatomic,retain)PersonEntity *person;
@end
