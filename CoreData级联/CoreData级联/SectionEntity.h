//
//  SectionEntity.h
//  CoreData级联
//
//  Created by yyl on 15/11/10.
//  Copyright (c) 2015年 fssj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CourseEntity;

@interface SectionEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * chapterId;
@property (nonatomic, retain) NSString * chapterName;
@property (nonatomic, retain) NSNumber * chapterNum;
@property (nonatomic, retain) NSNumber * sectionId;
@property (nonatomic, retain) NSString * sectionName;
@property (nonatomic, retain) NSNumber * sectionNum;
@property (nonatomic, retain) NSString * sectionUrl;
@property (nonatomic, retain) CourseEntity *section_course;

@end
