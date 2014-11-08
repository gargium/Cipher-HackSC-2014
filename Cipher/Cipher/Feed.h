//
//  Feed.h
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h> 

@interface Feed : UIViewController

- (IBAction)showFeed:(UIStoryboardSegue*)segue;
- (BOOL) prefersStatusBarHidden; 
- (void) setViewDefaults; 
@end

