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

//要 local 的 json
- (NSArray *) getJsonItems{
    NSError *err = nil;
    
    //找這個 data.json 的路徑在哪
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    
    NSLog(@"Hello: %@", dataPath);
    
    //讀這個 binary data
    NSData *jsonData = [NSData dataWithContentsOfFile:dataPath];
    
    //解析這個 binary data 成一個 array
    NSArray *locations = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&err];
    return locations;
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

- (void) OldgetItemsAsync:(void(^)(NSArray *items))callback{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //loading 動畫 會寫在 view
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //這段程式碼在背景處理
            NSArray *items = [self getJsonItems];
            
            //背景執行完後 丟回前景 (餵給 view)
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(items);
            });
        });
        
        //要資料丟到背景處理
        //NSArray *items = [self getJsonItems];
        //callback(items);
        
    });

    //沒有 dispatch 時只需要呼叫:
    //NSArray *items = [self getItems];
    //callback(items);
    
}

- (void) getItemsAsync:(void(^)(NSArray *items))callback{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //這段程式碼在背景處理
        NSArray *items = [self getJsonItems];
        
        //背景執行完後 丟回前景 (餵給 view)
        dispatch_async(dispatch_get_main_queue(), ^{
            callback(items);
        });
    });
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
