//
//  RootViewController.m
//  mosquitoSpace
//
//  Created by win on 2014/3/27.
//  Copyright (c) 2014年 win. All rights reserved.
//

#import "RootViewController.h"
#import "MapViewController.h"
#import "ListViewController.h"
#import "AboutViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MapViewController *mvc = [[MapViewController alloc] init];
    ListViewController *lvc = [[ListViewController alloc] init];
    AboutViewController *avc = [[AboutViewController alloc] init];
    
    UINavigationController *nav_mvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    UINavigationController *nav_lvc = [[UINavigationController alloc] initWithRootViewController:lvc];
    UINavigationController *nav_avc = [[UINavigationController alloc] initWithRootViewController:avc];
    UIImage* image = [[UIImage alloc] init];
    //nav_mvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"AAAA" image:nil tag:0];
    UITabBarItem *a = [[UITabBarItem alloc] initWithTitle:@"AAAA" image:nil tag:0];
    UITabBarItem *b = [[UITabBarItem alloc] initWithTitle:@"AAAA" image:image tag:0];
    nav_mvc.tabBarItem = b;
    nav_lvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"清單列表" image:image tag:1];
    
    self.viewControllers = @[nav_mvc, nav_lvc, nav_avc];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
