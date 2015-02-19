//
//  userTVC.h
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userDetailsTVC.h"

@interface userTVC : UITableViewController{

    NSMutableDictionary *dataDict;
    NSMutableDictionary *userDict;
    NSMutableArray *dataArray;
}

@property NSMutableArray *dataArray;
@property NSMutableDictionary *userDict;
@property NSMutableDictionary *dataDict;
@property(strong, nonatomic) userDetailsTVC *detailUserTVC;
- (IBAction)addUser:(id)sender;

@property (strong) UIActivityIndicatorView *mySpinner;

@end
