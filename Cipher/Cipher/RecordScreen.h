//
//  RecordScreen.h
//  Cipher
//
//  Created by Shivam Thapar on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>

@interface RecordScreen : UIViewController
- (IBAction)playBeat:(id)sender;
- (IBAction)recordFreestyle:(id)sender;
-(BOOL) prefersStatusBarHidden;
@property (weak, nonatomic) NSURL *beatURL;
@property (nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@property (nonatomic) AVAudioRecorder *audioRecorder;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *seconds;
- (IBAction)uploadAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@end
BOOL recording = NO;
BOOL beatPlaying = NO;

int mainInt;
NSTimer *timer;