//
//  TeacherEntity.h
//  CoreData级联
//
//  Created by yyl on 15/11/10.
//  Copyright (c) 2015年 fssj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CourseEntity;

@interface TeacherEntity : NSManagedObject

@property (nonatomic, retain) NSString * teacherDescription;
@property (nonatomic, retain) NSNumber * teacherId;
@property (nonatomic, retain) NSString * teacherName;
@property (nonatomic, retain) NSSet *teacher_course;
@end

@interface TeacherEntity (CoreDataGeneratedAccessors)

- (void)addTeacher_courseObject:(CourseEntity *)value;
- (void)removeTeacher_courseObject:(CourseEntity *)value;
- (void)addTeacher_course:(NSSet *)values;
- (void)removeTeacher_course:(NSSet *)values;

@end
