//
//  AboutViewController.m
//  mosquitoSpace
//
//  Created by win on 2014/3/27.
//  Copyright (c) 2014年 win. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    // Do any additional setup after loading the view from its nib.
    self.title = @"關於我們";
    
    //insert subview to scrollView
    [self.scrollView addSubview:self.contentView];
    
    //get contentView size
    CGSize contentSize = self.contentView.frame.size;
    self.scrollView.contentSize = contentSize;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
