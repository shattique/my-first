//
//  iconTVC.h
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iconTVC : UITableViewController
- (IBAction)logOut:(id)sender;
- (IBAction)userBtn:(id)sender;
- (IBAction)quizBtn:(id)sender;
- (IBAction)quesBtn:(id)sender;
- (IBAction)interViewBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarbtn;

@end
