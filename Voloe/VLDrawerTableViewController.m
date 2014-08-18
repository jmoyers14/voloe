//
//  VLDrawerTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLDrawerTableViewController.h"
#import "UIViewController+MMDrawerController.h"

typedef NS_ENUM(NSInteger, VLDrawerSection) {
    VLDrawerSectionNavigationItems,
    VLDrawerSectionTrending,
    VLDrawerSectionHelpAndSettings
};

@interface VLDrawerTableViewController () {
    NSArray *_trending;
    NSArray *_navigationItems;
    NSArray *_helpAndSettings;
}

@end

@implementation VLDrawerTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _trending        = [NSArray arrayWithObjects:@"Trending Goals",
                                                 @"Trending Users", nil];
    
    _navigationItems = [NSArray arrayWithObjects:@"Contest & Events",
                                                 @"Guide",
                                                 @"Your Profile",
                                                 @"Lounge",
                                                 @"Manage List",
                                                 @"Notifications",
                                                 @"Friends",
                                                 @"Followers",
                                                 @"Messages", nil];
    
    _helpAndSettings = [NSArray arrayWithObjects:@"Settings",
                                                 @"Support",
                                                 @"Terms of Use",
                                                 @"Privacy Policy",
                                                 @"Log Out", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case VLDrawerSectionNavigationItems:
            rows = [_navigationItems count];
            break;
        case VLDrawerSectionTrending:
            rows = [_trending count];
            break;
        case VLDrawerSectionHelpAndSettings:
            rows = [_helpAndSettings count];
            break;
    }
    return rows;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
        case VLDrawerSectionNavigationItems:
            break;
        case VLDrawerSectionTrending:
            title = @"Trending";
            break;
        case VLDrawerSectionHelpAndSettings:
            title = @"Help & Settings";
            break;
    }
    return title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DrawerCell" forIndexPath:indexPath];
    
    
    NSString *title;
    
    switch ([indexPath section]) {
        case VLDrawerSectionNavigationItems:
            title = [_navigationItems objectAtIndex:[indexPath row]];
            break;
        case VLDrawerSectionTrending:
            title = [_trending objectAtIndex:[indexPath row]];
            break;
        case VLDrawerSectionHelpAndSettings:
            title = [_helpAndSettings objectAtIndex:[indexPath row]];
            break;
    }

    [[cell textLabel] setText:title];
    
    return cell;
}


#pragma mark - TableViewDelegate methods

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UINavigationController *newCenter = [storyboard instantiateViewControllerWithIdentifier:@"ProfileNaveController"];

    switch ([indexPath section]) {
        case VLDrawerSectionNavigationItems:
            switch ([indexPath row]) {
                case 2:
                    [[self mm_drawerController] setCenterViewController:newCenter];
                    break;
                default:
                    break;
            }
            break;
        case VLDrawerSectionTrending:
            break;
        case VLDrawerSectionHelpAndSettings:
            break;
    }

    
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
