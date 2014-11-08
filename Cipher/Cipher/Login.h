//
//  ViewController.h
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Social/Social.h> 
#import <FacebookSDK/FacebookSDK.h> 
#import "SCSettings.h"
#import "SCErrorHandler.h"

@interface ViewController : UIViewController <FBLoginViewDelegate>

@property (nonatomic, strong) IBOutlet FBLoginView *loginView;
@property (nonatomic, strong) IBOutlet UIButton *continueButton;
- (IBAction)showLogin:(UIStoryboardSegue *)segue;

@end

