//
//  VLProfileTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLProfileTableViewController.h"
#import "VLCenterViewController.h"
#import "VLGridListTableViewCell.h"
@interface VLProfileTableViewController ()

@end

@implementation VLProfileTableViewController
@synthesize profilePicture      = _profilePicture;
@synthesize goalsAchievedButton = _goalsAchievedButton;
@synthesize goalsButton         = _goalsButton;
@synthesize assistsButton       = _assistsButton;
@synthesize friendsButton       = _friendsButton;
@synthesize followersButton     = _followersButton;

NSMutableArray *_goals;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addButtonLabels];
    
    _goals = [[NSMutableArray alloc] init];
    
    
    
#warning - remove dummy data
    for(int i = 1; i < 11; i++) {
        [_goals addObject:[UIImage imageNamed:[NSString stringWithFormat:@"test%d", i]]];
    }
    
}

//add title labels below the count displayed on each button
- (void) addButtonLabels {
    
#warning - remove dummy data
    //dummy data replace with real data
    NSString *goalCount = @"250";
    NSString *achievedCount = @"25";
    NSString *assistsCount = @"1004";
    NSString *friendsCount = @"3000";
    NSString *followersCount = @"2431";
    
    NSMutableAttributedString *goalTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Goals:\n%@", goalCount]];
    NSMutableAttributedString *achievedTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Goals achieved:\n%@", achievedCount]];
    NSMutableAttributedString *assistsTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Assists:\n%@", assistsCount]];
    NSMutableAttributedString *friendsTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Friends:\n%@", friendsCount]];
    NSMutableAttributedString *followersTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Followers:\n%@", followersCount]];
    
    
    
    
    
    UIFont *boldFont = [UIFont boldSystemFontOfSize:16];
    
    
    [goalTitle addAttribute:NSFontAttributeName value:boldFont range: [[goalTitle string] rangeOfString:goalCount]];
    [achievedTitle addAttribute:NSFontAttributeName value:boldFont range:[[achievedTitle string] rangeOfString:achievedCount]];
    [assistsTitle addAttribute:NSFontAttributeName value:boldFont range:[[assistsTitle string] rangeOfString:assistsCount]];
    [friendsTitle addAttribute:NSFontAttributeName value:boldFont range:[[friendsTitle string] rangeOfString:friendsCount]];
    [followersTitle addAttribute:NSFontAttributeName value:boldFont range:[[followersTitle string] rangeOfString:followersCount]];
    
    [[[self goalsButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self goalsButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self goalsButton] setAttributedTitle:goalTitle forState:UIControlStateNormal];
    
    [[[self goalsAchievedButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self goalsAchievedButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self goalsAchievedButton] setAttributedTitle:achievedTitle forState:UIControlStateNormal];
    
    [[[self assistsButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self assistsButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self assistsButton] setAttributedTitle:assistsTitle forState:UIControlStateNormal];
    
    [[[self friendsButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self friendsButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self friendsButton] setAttributedTitle:friendsTitle forState:UIControlStateNormal];
    
    [[[self followersButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self followersButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self followersButton] setAttributedTitle:followersTitle forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([_goals count] + 2) / 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VLGridListTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"GridListCell" forIndexPath:indexPath];
    
    NSInteger colOne = [indexPath row] * 3;
    NSInteger colTwo = ([indexPath row] * 3) + 1;
    NSInteger colThree = ([indexPath row] * 3) + 2;
    
    if (colOne < [_goals count]) {
        [[cell colOneImage] setImage:[_goals objectAtIndex:colOne]];
    } else {
        [[cell colOneImage] setHidden:YES];
    }
    
    if (colTwo < [_goals count]) {
        [[cell colTwoImage] setImage:[_goals objectAtIndex:colTwo]];
    } else {
        [[cell colTwoImage] setHidden:YES];
    }
    
    if (colThree < [_goals count]) {
        [[cell colThreeImage] setImage:[_goals objectAtIndex:colThree]];
    } else {
        [[cell colThreeImage] setHidden:YES];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.0;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
