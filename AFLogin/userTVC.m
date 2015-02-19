//
//  userTVC.m
//  AFLogin
//
//  Created by User on 2/18/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import "userTVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "userTVCell.h"
#import "userDetailsTVC.h"
#import "userFormTVC.h"

@interface userTVC ()

@end

@implementation userTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"http://skimranhossain.com/api/get-users.php"; //Replace with desired URL
    

AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
manager.responseSerializer = [AFJSONResponseSerializer serializer];
//NSDictionary *parameters = @{@"email": username, @"password": password};
[manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

NSLog(@"%@",operation.responseString);

 dataDict = [responseObject objectForKey:@"data"];
 dataArray = [responseObject objectForKey:@"data"];
 [self.tableView setHidden:NO];
 [self.tableView reloadData];
 
 NSLog(@"%d",[dataArray count]);
 
//Sample logic to check login status
if ([operation.responseString rangeOfString:@"You are logged in as"].location == NSNotFound) {
NSLog(@"Bad login.");
} else {
NSLog(@"Login successful!");
}
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
NSLog(@"Error: %@", error);
}];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{

    //_mySpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    //[_mySpinner startAnimating];
    
    _mySpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _mySpinner.center = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height / 2.0);
    [self.tableView addSubview: _mySpinner];
    [self.tableView bringSubviewToFront:_mySpinner];
    _mySpinner.hidesWhenStopped = YES;
    _mySpinner.hidden = NO;
    [_mySpinner startAnimating];

  NSString *urlString = @"http://skimranhossain.com/api/get-users.php"; //Replace with desired URL
    

AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
manager.responseSerializer = [AFJSONResponseSerializer serializer];
//NSDictionary *parameters = @{@"email": username, @"password": password};

[manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

NSLog(@"%@",operation.responseString);



 _dataDict = [responseObject objectForKey:@"data"];
 _dataArray = [responseObject objectForKey:@"data"];
 [self.tableView setHidden:NO];
 [self.tableView reloadData];
 
 [_mySpinner stopAnimating];
 NSLog(@"%d",[_dataArray count]);
 
//Sample logic to check login status
if ([operation.responseString rangeOfString:@"You are logged in as"].location == NSNotFound) {
} else {
NSLog(@"Login successful!");
}
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
NSLog(@"Error: %@", error);
}];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataArray count];
    
    
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

      NSLog(@"%d",[_dataArray count]);

    static NSString *cellID = @"Cell";
    //userTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell) {
//        cell = [[userTVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//        
//    }
    userTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    _userDict =[ _dataArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@",_userDict);
    
    cell.userNameLbl.text = [_userDict objectForKey:@"email"];
   // cell.ledgerCodeLbl.text = [self.coreDict objectForKey:@"INSTRUMENT"];

  //
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"userSegue"]) {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    _dataDict = [_dataArray objectAtIndex:indexPath.row];
    _detailUserTVC = (userDetailsTVC*)[segue destinationViewController];
    
    [_detailUserTVC setDetailDict:_dataDict];
}
}


- (IBAction)addUser:(id)sender {

    userFormTVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"userFormTVC"];
   [self.navigationController pushViewController:controller animated:NO];

}
@end
