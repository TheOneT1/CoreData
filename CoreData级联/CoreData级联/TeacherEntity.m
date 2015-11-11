//
//  TeacherEntity.m
//  CoreData级联
//
//  Created by yyl on 15/11/10.
//  Copyright (c) 2015年 fssj. All rights reserved.
//


/*
 
 在声明property属性后，有2种实现选择
 
 @synthesize
 
 编译器期间，让编译器自动生成getter/setter方法。
 
 当有自定义的存或取方法时，自定义会屏蔽自动生成该方法
 
 
 
 @dynamic
 
 告诉编译器，不自动生成getter/setter方法，避免编译期间产生警告
 
 然后由自己实现存取方法
 
 或存取方法在运行时动态创建绑定：主要使用在CoreData的实现NSManagedObject子类时使用，由Core Data框架在程序运行的时动态生成子类属性
 */

#import "TeacherEntity.h"
#import "CourseEntity.h"

@implementation TeacherEntity

@dynamic teacherDescription;
@dynamic teacherId;
@dynamic teacherName;
@dynamic teacher_course;

@end
