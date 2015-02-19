//
//  userFormTVC.m
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import "userFormTVC.h"
#import "AFHTTPRequestOperationManager.h"

@interface userFormTVC ()

@end

@implementation userFormTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)done:(id)sender {

NSString *email = _emailTxt.text;
NSString *password = _idTxt.text;
NSString *role = _roleTxt.text;
 
NSString *urlString = @"http://skimranhossain.com/api/add-user.php"; //Replace with desired URL


AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
manager.responseSerializer = [AFJSONResponseSerializer serializer];
NSDictionary *parameters = @{@"email": email, @"password": password, @"role":role};
[manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

NSLog(@"%@",operation.responseString);

NSString *success = [responseObject objectForKey:@"success"];
 NSLog(@"adduser%@",responseObject);
 
 NSInteger sucss = [success intValue];
 
 if (sucss == 1) {
 
   UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Add Successfully" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
   
   
 
    NSLog(@"Login successful!");
}
else {

NSString *msg = [responseObject objectForKey:@"msg"];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:msg message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    
}

//Sample logic to check login status
if ([operation.responseString rangeOfString:@"You are logged in as"].location == NSNotFound) {

} else {
NSLog(@"Login successful!");
}
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
NSLog(@"Error: %@", error);
}];

//[self.navigationController popViewControllerAnimated:NO];
}
@end
