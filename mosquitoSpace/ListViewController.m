//
//  ListViewController.m
//  mosquitoSpace
//
//  Created by win on 2014/3/27.
//  Copyright (c) 2014年 win. All rights reserved.
//

#import "ListViewController.h"
//like SDK
#import <AFNetworking/AFNetworking.h>

@interface ListViewController ()
@property (nonatomic, strong) NSArray *items;
@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//pragma 是什麼 ??
#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.title = @"List";
    self.items = @[@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy"];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
    //告訴表格視圖一個段落有幾列
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ListTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = self.items[indexPath.row];
    NSLog(@"%d", indexPath.row);
    return cell;
}

@end
