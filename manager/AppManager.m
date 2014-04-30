//
//  AppManager.m
//  mosquitoSpace
//
//  Created by win on 2014/4/30.
//  Copyright (c) 2014年 win. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager

- (NSArray *) getItems{
    return @[@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy",@"win", @"Jason",@"Issac", @"paddy"];
}

/*
 var manager = {
 getItems: function(callback){
 var items = [1,2,3,4];
 callback(items);
 }
 }
 
 manager.getItems(function(items){
 console.log(items);
 })
 */

- (void) getItemsAsync:(void(^)(NSArray *items))callback{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //loading 動畫 會寫在 view
        NSArray *items = [self getItems];
        callback(items);
    });

    //沒有 dispatch 時只需要呼叫:
    //NSArray *items = [self getItems];
    //callback(items);
    
}

+ (AppManager *)sharedInstance
{
    // 1
    static AppManager *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[AppManager alloc] init];
    });
    return _sharedInstance;
}
@end
