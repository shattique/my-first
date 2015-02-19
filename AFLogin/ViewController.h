//
//  ViewController.h
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;

@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
- (IBAction)loginbtn:(id)sender;

@end

