//
//  ViewController.m
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import "Login.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Social/Social.h>
#import "SCSettings.h"
#import "SCErrorHandler.h"

@interface ViewController ()

@end
@implementation ViewController

BOOL _viewIsVisible;
BOOL _viewDidAppear;

- (BOOL) prefersStatusBarHidden {
    return YES;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Facebook SDK * pro-tip *
        // We wire up the FBLoginView using the interface builder
        // but we could have also explicitly wired its delegate here.
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    FBLoginView *loginView = [[FBLoginView alloc] init];
//    //loginView.center = self.view.center;
//    loginView.frame = CGRectMake(self.view.frame.size.width/5.8, self.view.frame.size.height-100, self.view.frame.size.width /1.5, 50);
//    [self.view addSubview:loginView];
    
    self.loginView.readPermissions = @[@"public_profile", @"user_friends"];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"init.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
//    UITapGestureRecognizer *taps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKeyboard)];
//    [self.view addGestureRecognizer:taps];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    SCSettings *settings = [SCSettings defaultSettings];
    if (_viewDidAppear) {
        _viewIsVisible = YES;
        
        // reset
        settings.shouldSkipLogin = NO;
    } else {
        [FBSession openActiveSessionWithAllowLoginUI:NO];
        FBSession *session = [FBSession activeSession];
        if (settings.shouldSkipLogin || session.isOpen) {
            [self performSegueWithIdentifier:@"showFeed" sender:nil];
        } else {
            _viewIsVisible = YES;
        }
        _viewDidAppear = YES;
    }

}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    if (_viewIsVisible) {
        [self performSegueWithIdentifier:@"showFeed" sender:loginView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showLogin:(UIStoryboardSegue *)segue
{
    // This method exists in order to create an unwind segue to this controller.
}

- (void)loginView:(FBLoginView *)loginView
      handleError:(NSError *)error {
    SCHandleError(error);
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSString *title = [NSString stringWithFormat:@"continue as %@", [user name]];
    [self.continueButton setTitle:title forState:UIControlStateNormal];
}


- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    if (_viewIsVisible) {
        [self performSegueWithIdentifier:@"continue" sender:loginView];
    }
    [self.continueButton setTitle:@"continue as a guest" forState:UIControlStateNormal];
}


@end
