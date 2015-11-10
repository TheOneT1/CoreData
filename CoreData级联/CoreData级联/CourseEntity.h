//
//  CourseEntity.h
//  CoreData级联
//
//  Created by yyl on 15/11/10.
//  Copyright (c) 2015年 fssj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface CourseEntity : NSManagedObject

@property (nonatomic, retain) NSString * courseDescription;
@property (nonatomic, retain) NSNumber * courseId;
@property (nonatomic, retain) NSString * courseImgUrl;
@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSNumber * isFollow;
@property (nonatomic, retain) NSSet *course_teacher;
@property (nonatomic, retain) NSSet *course_section;
@end

@interface CourseEntity (CoreDataGeneratedAccessors)

- (void)addCourse_teacherObject:(NSManagedObject *)value;
- (void)removeCourse_teacherObject:(NSManagedObject *)value;
- (void)addCourse_teacher:(NSSet *)values;
- (void)removeCourse_teacher:(NSSet *)values;

- (void)addCourse_sectionObject:(NSManagedObject *)value;
- (void)removeCourse_sectionObject:(NSManagedObject *)value;
- (void)addCourse_section:(NSSet *)values;
- (void)removeCourse_section:(NSSet *)values;

@end
