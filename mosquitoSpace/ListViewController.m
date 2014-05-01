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
#import "AppManager.h"

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
    
    //不要讓 tableview 跑到 tabbar 下面

    // xib 的 view 要設定 tab bar
    //記得在 xib 的 view 設定 constrain?
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    // Do any additional setup after loading the view from its nib.
    //self.title = @"List";
    //self.items = @[@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy"];
    AppManager *manager = [AppManager sharedInstance]; //+
    
    //同步
    //self.items = [manager getItems]; //-
    
    
    //start animation
    self.loading.hidden = NO;

    //這是非同步的做法
    [manager getItemsAsync:^(NSArray *items) {
        
        //stop animation
        self.loading.hidden = YES;
        
        self.items = items;
        [self.locationTableView reloadData];
    }];
    
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
    NSDictionary *location = self.items[indexPath.row];
    cell.textLabel.text = location[@"title"];

    //錯誤寫法，去要 json 的 image 不是這樣要，json 的 image 都是一個網址，所以應該會跟 NSURL 有關
    //cell.imageView.image = [UIImage imageNamed:location[@"Thumbnail"]];
    
    NSLog(@"%d", indexPath.row);
    return cell;
}

@end
