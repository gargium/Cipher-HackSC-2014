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
@synthesize entries, entriesOutlet;

- (void)viewDidLoad {
    entries = [[NSMutableArray alloc] init];
    NSArray *data  = @[@{
                           
                           @"name" : @"Shivam T.",
                           
                           @"beatName" : @"DJ Rak 2014 MadCypher"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Rakshit G.",
                           
                           @"beatName" : @"DJ Rak 2014 MadCypher"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Jayendra J.",
                           
                           @"beatName" : @"Hilary Duff Mix 2010"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Adam J.",
                           
                           @"beatName" : @"DJ Mustard Summertime"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Ravi J.",
                           
                           @"beatName" : @"You See Me Instrumental"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Alex R.",
                           
                           @"beatName" : @"I'm a Barbie Girl Mix"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Rohan K.",
                           
                           @"beatName" : @"Pound Cake Freestyle"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Nelson L.",
                           
                           @"beatName" : @"A$AP Mob Mashup"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Mark W.",
                           
                           @"beatName" : @"Whoop Whoop Swag Instrumental"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Aravind R.",
                           
                           @"beatName" : @"Sruthi Mix 2000"
                           
                           },
                       
                       @{
                           
                           @"name" : @"Ronaq V.",
                           
                           @"beatName" : @"Ratchet Summer Jam"
                           
                           }
                       
                       
                       
                       ];
    
    for (int i = 0; i<10; i++){
        
        NSString *str = [NSString stringWithFormat:@"%@ cont. to %@",[[data objectAtIndex:i] objectForKey:@"name"], [[data objectAtIndex:i] objectForKey:@"beatName"]];
        NSLog(str);
        
        [entries addObject:str];
        
        
    }
    
    NSLog(@"hey");
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setViewDefaults];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return [entries count];
    
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


-(BOOL)prefersStatusBarHidden {
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)showFeed:(UIStoryboardSegue *)segue {
    
}

-(void)setViewDefaults {
    
    UIImage *backgroundImage = [UIImage imageNamed:@"BearBlur.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
}
@end
