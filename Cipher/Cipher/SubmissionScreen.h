//
//  SubmissionScreen.h
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmissionScreen : UIViewController <UITableViewDataSource, UITableViewDelegate>

-(BOOL) prefersStatusBarHidden;
@property (weak, nonatomic) IBOutlet UITableView *entriesOutlet;
@property NSMutableArray *entries;

@end
