//
//  ViewController.m
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "iconTVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    NSLog(@"ijhujih");
   
}

- (void)viewWillAppear:(BOOL)animated
{

  [self.navigationController setNavigationBarHidden:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginbtn:(id)sender {

 NSString *username = _usernameTxt.text;
NSString *password = _passwordTxt.text;
 
NSString *urlString = @"http://skimranhossain.com/api/check-user.php"; //Replace with desired URL


AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
manager.responseSerializer = [AFJSONResponseSerializer serializer];
NSDictionary *parameters = @{@"email": username, @"password": password};
[manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

NSLog(@"%@",operation.responseString);

NSString *success = [responseObject objectForKey:@"success"];
 NSLog(@"%@",success);
 
 NSInteger sucss = [success intValue];
 
 if (sucss == 1) {
 
    iconTVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"iconTVC"];
   [self.navigationController pushViewController:controller animated:NO];
   
   
 
    NSLog(@"Login successful!");
}

//Sample logic to check login status
if ([operation.responseString rangeOfString:@"You are logged in as"].location == NSNotFound) {
NSLog(@"Bad login.");
} else {
NSLog(@"Login successful!");
}
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
NSLog(@"Error: %@", error);
}];
}
@end
