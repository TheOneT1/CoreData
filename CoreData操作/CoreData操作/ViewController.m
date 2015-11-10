//
//  ViewController.m
//  CoreData操作
//
//  Created by yyl on 15/11/9.
//  Copyright (c) 2015年 fssj. All rights reserved.
//
/***********************************
 
    转: http://blog.csdn.net/q199109106q/article/details/8563438/
    转：http://blog.csdn.net/kesalin/article/details/6739319
    转：http://www.jianshu.com/p/e9f3b5e0cd19
 
 ***********************************/
#import "ViewController.h"
#import "AppDelegate.h"
#import "CardEntity.h"
#import "PersonEntity.h"
#define  KAppdelegate [UIApplication sharedApplication].delegate
@interface ViewController ()
{
    NSMutableArray *_itemsArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docmentpath = [paths objectAtIndex:0];
    NSLog(@"沙盒路径----%@",docmentpath);
   // _itemsArr = [[NSMutableArray alloc] init];
    
    UIButton *lBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [lBtn setTitle:@"插入" forState:normal];
    [lBtn addTarget:self action:@selector(insertData) forControlEvents:UIControlEventTouchUpInside];
    lBtn.frame = CGRectMake(10, 20, 100, 30);
    [self.view addSubview:lBtn];
    
    UIButton *rBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rBtn setTitle:@"删除" forState:normal];
    [rBtn addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchUpInside];
    rBtn.frame = CGRectMake(self.view.frame.size.width-100, 20, 100, 30);
    [self.view addSubview:rBtn];
    
    [self getEntity];
    
    
    
   // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemsArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:1 reuseIdentifier:@"cell"];
    }
    
    PersonEntity *person = _itemsArr[indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.card.no;
    return cell;
}

//增加数据
-(void)insertData
{
    //创建上下文
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    
    //创建上下文
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    //插入数据到person
    PersonEntity *person  = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    person.name = @"德莱文";
    person.age = @"45";
    
    
    CardEntity *card=[NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    card.no = @"1153539504";
    
    person.card = card;
   // card.person = person;
   // NSLog(@"person.card.no----%@",person.card.no);
    
    NSError *error;
    // 保存到数据库
    BOOL suceess = [context save:&error];
    if (!suceess) {
        NSLog(@"插入出错----%@",[error localizedDescription]);
    }
    
    [self getEntity];
}
// 获取coredata数据
-(void)getEntity
{
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    
    //创建上下文
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    //找实体
    NSEntityDescription *person_Entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    
    //初始化一个查询请求
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = person_Entity;
    
    
    //执行这个查询
    NSError *err;
    NSArray *resultArray = [context executeFetchRequest:fetchRequest error:&err];
    NSLog(@"输出结果--%@",resultArray);
    
    if (resultArray.count>0) {
        PersonEntity *person = resultArray[0];
        NSLog(@"person对象属性----%@",person.card);
        _itemsArr = [[NSMutableArray alloc] initWithArray:resultArray];
    }else{
        _itemsArr = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
   [_tableView reloadData];
  
}
//删除数据
-(void)deleteData
{
    NSManagedObjectContext *context = [(AppDelegate*)KAppdelegate managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *datas = [context executeFetchRequest:fetchRequest error:&error];
    if (datas) {
        for (PersonEntity *entity in datas) {
            
            if ([entity.card.no isEqualToString:@"1153539504"]) {
                [context deleteObject:entity];
            }
        }
    }
    
    [self getEntity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
