//
//  userFormTVC.h
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userFormTVC : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *roleTxt;
@property (weak, nonatomic) IBOutlet UITextField *idTxt;
- (IBAction)done:(id)sender;

@end
