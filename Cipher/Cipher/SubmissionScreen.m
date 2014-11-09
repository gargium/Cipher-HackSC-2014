//
//  SubmissionScreen.m
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import "SubmissionScreen.h"

@interface SubmissionScreen ()

@end

@implementation SubmissionScreen

@synthesize entries, stitchedSongButton;

bool flag = YES;

-(BOOL) prefersStatusBarHidden {
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (IBAction)playStitchedSong:(id)sender {
    UIImage *play = [UIImage imageNamed:@"playSubmission.png"];
    UIImage *pause = [UIImage imageNamed:@"pauseSummation.png"];
    
    
    if (flag) {
        [stitchedSongButton setImage:pause forState:UIControlStateNormal];
        flag = NO;
    }
    else {
        [stitchedSongButton setImage:play forState:UIControlStateNormal];
        flag = YES;
        
    }
}



- (IBAction)tweet:(id)sender {
    
    //  Checking if Twitter account is available on device
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        mySLComposerSheet = [[SLComposeViewController alloc] init]; // Initiate Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter]; //Specify that we want Twitter,
        //  not an alternate Social Network
        
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"Just freestyled on Cipher! Get the app and freestyle with me!", mySLComposerSheet.serviceType]]; //Default text that will show up in the box
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        
        //  BASIC ERROR MANAGEMENT:
        //  Returns a popup alert notifying the user whether the post was successful or if the action was cancelled
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successful";
            default:
                break;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];

    
}
- (IBAction)shareOnFacebook:(id)sender {
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        mySLComposerSheet = [[SLComposeViewController alloc] init];
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"Just freestyled on Cipher! Get the app and freestyle with me!", mySLComposerSheet.serviceType]];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successful";
            default:
                break;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
    
}

- (IBAction)inviteFriends:(id)sender {
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [entries objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return [entries count];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    entries = [[NSMutableArray alloc] init];
    NSArray *data  = @[@{
                           
                           @"name" : @"Shivam T."
                           
                           },
                       
                       @{
                           
                           @"name" : @"Rakshit G.",

                           },
                       
                       @{
                           
                           @"name" : @"Jayendra J.",

                           },
                       
                       @{
                           
                           @"name" : @"Adam J.",

                           },
                       
                       @{
                           
                           @"name" : @"HackSC",

                           },
                       
                       @{
                           @"name": @"Ravi J.",
                           
                           },
                       
                       @{
                           @"name": @"Aravind R.",
                           
                           },
 
                       ];
    
    for (int i = 0; i<7; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%@ contributed",[[data objectAtIndex:i] objectForKey:@"name"]];
        NSLog(str);
        
        
        [entries addObject:str];
    UIImage *backgroundImage = [UIImage imageNamed:@"BearBlur.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0]; 
    
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
