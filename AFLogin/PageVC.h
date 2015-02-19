//
//  PageVC.h
//  AFLogin
//
//  Created by User on 2/19/15.
//  Copyright (c) 2015 esoftarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageVC : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControll;
- (IBAction)changePage:(id)sender;



@end
