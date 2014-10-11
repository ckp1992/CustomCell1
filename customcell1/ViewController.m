//
//  ViewController.m
//  customcell1
//
//  Created by  陈鲲鹏 on 14-10-11.
//  Copyright (c) 2014年  陈鲲鹏. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dataList;
@synthesize imageList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //加载PLIST和图片
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"friends" withExtension:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
    NSMutableArray *tmpImageArray = [[NSMutableArray alloc] init];
    
    //循环加载
    
    for(int i = 0;i<[dictionary count];i++){
        //加载plist内容
        NSString *key = [[NSString alloc] initWithFormat:@"%i",i+1];
        NSDictionary *tmpDic = [dictionary objectForKey:key];
        [tmpDataArray addObject:tmpDic];
        
        //加载图片内容
        NSString *strImageUrl = [[NSString alloc] initWithFormat:@"%i.jpg",i+1];
        UIImage *image = [UIImage imageNamed:strImageUrl];
        [tmpImageArray addObject:image];
    }
    
    self.dataList = [tmpDataArray copy];
    self.imageList = [tmpImageArray copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//table Data source里面的方法

//返回行数
- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataList count];
}

//新建某一行并且返回
- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
    static BOOL nibsRegistered = NO;
    
    if(!nibsRegistered){
        UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    }
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowData = [self.dataList objectAtIndex:row];
    
    cell.name = [rowData objectForKey:@"name"];
    cell.dec = [rowData objectForKey:@"dec"];
    cell.loc = [rowData objectForKey:@"loc"];
    cell.image = [self.imageList objectAtIndex:row];
    
    return cell;
}

//Table Delegate Methods里的方法
- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

- (NSIndexPath *) tableView:(UITableView *) tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


@end
