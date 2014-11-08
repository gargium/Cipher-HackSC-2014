//
//  RecordScreen.m
//  Cipher
//
//  Created by Shivam Thapar on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import "RecordScreen.h"

@interface RecordScreen ()

@end

@implementation RecordScreen

NSURL *reUrl;

@synthesize beatURL, backgroundMusicPlayer, audioRecorder;

- (void)viewDidLoad {
    /*
     UIImage *backgroundImage = [UIImage imageNamed:@"init.png"];
     UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
     backgroundImageView.image = backgroundImage;
     [self.view insertSubview:backgroundImageView atIndex:0];
     */
    
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"freestyle.m4a",
                               nil];
    reUrl = [NSURL fileURLWithPathComponents:pathComponents];
    NSLog([reUrl path]);
    
    NSDictionary *audioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithFloat:44100],AVSampleRateKey,
                                   [NSNumber numberWithInt: kAudioFormatAppleLossless],AVFormatIDKey,
                                   [NSNumber numberWithInt: 1],AVNumberOfChannelsKey,
                                   [NSNumber numberWithInt:AVAudioQualityMedium],AVEncoderAudioQualityKey,nil];
    
    audioRecorder = [[AVAudioRecorder alloc]
                     initWithURL:reUrl
                     settings:audioSettings
                     error:nil];
    
    [audioRecorder prepareToRecord];
    
    [super viewDidLoad];
    
    // Do view setup here.
}

- (IBAction)playBeat:(id)sender {
    if(!beatPlaying){
        [self playBeat];
        beatPlaying = YES;
    }
    else{
        [backgroundMusicPlayer stop];
        beatPlaying = NO;
    }
    
}

- (void) playBeat{
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"beat" ofType:@"m4a"];
    NSLog(path);
    NSLog(@"\n");
    
    NSURL *url = [NSURL fileURLWithPath:path];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
    [backgroundMusicPlayer prepareToPlay];
    [backgroundMusicPlayer play];
}

- (IBAction)recordFreestyle:(id)sender {
    NSError *error;
    
    if(!recording){
        NSLog([[audioRecorder url] path]);
        [self playBeat];
        [audioRecorder record];
        NSLog(@"recording");
        recording = YES;
    }
    else{
        if(audioRecorder){
            [audioRecorder stop];
        }
        recording = NO;
        UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: &error];
        
        AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
        
        NSLog([reUrl path]);
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[reUrl path] error:&error];
        
        NSNumber *fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
        long long fileSize = [fileSizeNumber longLongValue];
        NSLog(@"My long long is: %lld", fileSize);
        backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:reUrl error:&error];
        [backgroundMusicPlayer prepareToPlay];
        [backgroundMusicPlayer play];
        
    }
}


/**
 NSError *error;
 // Set the audio file
 NSArray *pathComponents = [NSArray arrayWithObjects:
 [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
 @"freestyle.m4a",
 nil];
 NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
 
 // Define the recorder setting
 AVAudioSession *session = [AVAudioSession sharedInstance];
 [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
 NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
 
 [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
 [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
 [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
 
 audioRecorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:&error];
 audioRecorder.meteringEnabled = YES;
 [audioRecorder prepareToRecord];
 NSLog(@"button press");
 
 if(!recording){
 [session setActive:YES error:nil];
 
 // Start recording
 [audioRecorder record];
 recording = YES;
 }
 else{
 [audioRecorder stop];
 [session setActive:NO error:nil];
 NSString *path = [[NSBundle mainBundle] pathForResource:@"freestyle" ofType:@"m4a"];
 NSLog(path);
 NSLog(@"\n");
 recording = NO;
 NSURL *url = [NSURL fileURLWithPath:path];
 backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioRecorder.url error: &error];
 [backgroundMusicPlayer prepareToPlay];
 [backgroundMusicPlayer play];
 
 }
 **/


@end
