//
//  userDetailsTVC.h
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userDetailsTVC : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *useridLbl;
@property (weak, nonatomic) IBOutlet UILabel *userRoleLbl;
@property (weak, nonatomic) IBOutlet UILabel *useremailLbl;

@property(strong, nonatomic) NSMutableDictionary *detailDict;

@end
