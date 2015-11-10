//
//  ViewController.m
//  CoreData级联
//
//  Created by yyl on 15/11/10.
//  Copyright (c) 2015年 fssj. All rights reserved.
//
/***********************************
 
 // 感谢：http://www.jianshu.com/p/e9f3b5e0cd19
 
 ***********************************/

/*
 A.ab->B :A对象指向B的删除关系ab被设置为:
 No Action:当A被删除时,B对象不变,但会指向一个不存在的对象,一般不建议使用;
 
 Nullify(作废):当A对象被删除时,B对象指向的A对象会置为空,如果A与B的关系式一对多,则是A对象从B容器中移除
 
 Cascade(级联):当A对象被删除时,A对象指向的B对象也会被删除;
 
 Deny(拒绝):当删除指向对象B存在的A对象时,操作将会被拒绝;
 */

// 级联删除
/*
 级联还指用来设计一对多关系。例如一个表存放老师的信息:表A（姓名，性别，年龄），姓名为主键。还有一张表存放老师所教的班级信息:表B（姓名，班级）。他们通过姓名来级联。级联的操作有级联更新，级联删除。 在启用一个级联更新选项后，就可在存在相匹配的外键值的前提下更改一个主键值。系统会相应地更新所有匹配的外键值。如果在表A中将姓名为张三的记录改为李四，那么表B中的姓名为张三的所有记录也会随着改为李四。级联删除与更新相类似。如果在表A中将姓名为张三的记录删除，那么表B中的姓名为张三的所有记录也将删除。
 */

// 课程_教师 (一课程可包含多个教师,删除关系:作废(Nullify) )
// 课程_章节(一课程可包含多个章节,删除关系:级联(Cascade) )
// 章节_课程(一个章节只属于一个课程,删除关系:作废(Nullify) )
// 教师_课程(一个教师可以讲多门课,删除关系:作废(Nullify) )

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
