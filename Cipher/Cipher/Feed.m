//
//  Feed.m
//  Cipher
//
//  Created by Gargium on 11/8/14.
//  Copyright (c) 2014 rakshitgarg. All rights reserved.
//

#import "Feed.h"

@interface Feed ()

@end

@implementation Feed

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setViewDefaults]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {
    return YES; 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showFeed:(UIStoryboardSegue *)segue {
    
}

-(void)setViewDefaults {
    
    UIImage *backgroundImage = [UIImage imageNamed:@"BearBlur.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
}
@end
