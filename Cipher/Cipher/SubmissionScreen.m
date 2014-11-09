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

@synthesize entries;

-(BOOL) prefersStatusBarHidden {
    return  YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [entries objectAtIndex:indexPath.row];
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
    
    for (int i = 0; i<5; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%@ cont. to this song",[[data objectAtIndex:i] objectForKey:@"name"]];
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
