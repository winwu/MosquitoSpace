//
//  ListViewController.h
//  mosquitoSpace
//
//  Created by win on 2014/3/27.
//  Copyright (c) 2014年 win. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *locationTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@end
