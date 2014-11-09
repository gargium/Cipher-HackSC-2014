//
//  SubmissionScreen.h
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface SubmissionScreen : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
//    create new slcomposeviewcontroller to handle the facebook
//    and twitter requests in the .m file

SLComposeViewController *mySLComposerSheet;
}

-(BOOL) prefersStatusBarHidden;
@property (weak, nonatomic) IBOutlet UITableView *entriesOutlet;
@property NSMutableArray *entries;

- (IBAction)tweet:(id)sender;
- (IBAction)shareOnFacebook:(id)sender;
- (IBAction)playStitchedSong:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *stitchedSongButton;

@end
