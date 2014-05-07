//
//  DetailViewController.m
//  mosquitoSpace
//
//  Created by win on 2014/3/27.
//  Copyright (c) 2014年 win. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    [self createImageScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createImageScrollView{
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 100, 320, 100);
    
    
    UIView *contentView = [[UIView alloc] init];
    
    
    NSInteger imageViewHeight = 200;
    NSInteger imageViewWidth = 320;
    NSArray *images = @[[UIImage imageNamed:@"001.jpg"],
                        [UIImage imageNamed:@"002.jpg"],
                        [UIImage imageNamed:@"003.jpg"],
                        [UIImage imageNamed:@"004.jpg"],
                        [UIImage imageNamed:@"005.jpg"]];
    
    contentView.frame = CGRectMake(0, 0, imageViewWidth* images.count, imageViewHeight);
    for (int i = 0 ; i< images.count; i++) {
        UIImage *image = images[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = CGRectMake(imageViewWidth*i , 0, imageViewWidth, imageViewHeight);
        imageView.frame = frame;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [contentView addSubview:imageView];
    }
    
    [scrollView addSubview:contentView];
    scrollView.contentSize = contentView.frame.size;
    [self.view addSubview:scrollView];
    
    contentView.backgroundColor = [UIColor blueColor];
    scrollView.backgroundColor = [UIColor redColor];
}

@end
