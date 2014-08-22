//
//  VLDrawerTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLDrawerTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "VLDrawerTableViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

typedef NS_ENUM(NSInteger, VLDrawerSection) {
    VLDrawerSectionNavigationItems,
    VLDrawerSectionTrending,
    VLDrawerSectionHelpAndSettings
};

typedef NS_ENUM(NSInteger, VLTrendingRow) {
    VLTrendingRowGoals,
    VLTrendingRowUsers
};

typedef NS_ENUM(NSInteger, VLHelpRow) {
    VLHelpRowSettings,
    VLHelpRowSupport,
    VLHelpRowTermsOfUse,
    VLHelpRowPrivacy,
    VLHelpRowLogOut
};

typedef NS_ENUM(NSInteger, VLNavigationItemRow) {
    VLNavigationItemRowContest,
    VLNavigationItemRowGuide,
    VLNavigationItemRowProfile,
    VLNavigationItemRowLounge,
    VLNavigationItemRowManageList,
    VLNavigationItemRowNotifications,
    VLNavigationItemRowFriends,
    VLNavigationItemRowFollowers,
    VLNavigationItemRowMessages
};

@interface VLDrawerTableViewController () {
    NSMutableArray *_trending;
    NSMutableArray *_navigationItems;
    NSMutableArray *_helpAndSettings;
}

@end


/*Class for representing view controller data*/
@interface _viewInfo : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *imageName;
@end

@implementation _viewInfo
@synthesize title      = _title;
@synthesize identifier = _identifier;
@synthesize index      = _index;
@synthesize imageName  = _imageName;
//designated initializer
- (id) initWithTitle:(NSString *)title identifier:(NSString *)identifer imageName:(NSString *)name index:(NSInteger)index  {
    self = [super init];
    if (self) {
        [self setTitle:title];
        [self setIdentifier:identifer];
        [self setIndex:index];
        [self setImageName:name];
    }
    return self;
}

- (id) init {
    //call designated initializer
    return [self initWithTitle:nil identifier:nil  imageName:nil index:0];
}

@end


@implementation VLDrawerTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set up view structure information
    [self initializeNavigationViewStructures];
    [self initializeTrendingViewStructures];
    [self initializeHelpAndSettingsViewStructures];

    
}

#pragma mark - Initialize view structures
//fill data structres with information for each view in the navigation section
- (void) initializeNavigationViewStructures {
    NSArray *navigationTitles = [NSArray arrayWithObjects:@"Contest & Events",
                                 @"Guide",
                                 @"Your Profile",
                                 @"Lounge",
                                 @"Manage List",
                                 @"Notifications",
                                 @"Friends",
                                 @"Followers",
                                 @"Messages", nil];
    
    NSArray *navigationIdentifiers = [NSArray arrayWithObjects:@"ContestNavController",
                                      @"GuideNavController",
                                      @"ProfileNavController",
                                      @"LoungeNavController",
                                      @"ManageListNavController",
                                      @"NotificationsNavController",
                                      @"FriendsNavController",
                                      @"FollowersNavController",
                                      @"MessagesNavController",nil];
    
    NSArray *navigationIcons = [NSArray arrayWithObjects:@"contest-trophy",
                                @"blue-guide",
                                @"blue-user-profile",
                                @"blue-lounge",
                                @"blue-manage-list",
                                @"blue-notifications",
                                @"blue-friends",
                                @"blue-follower",
                                @"blue-messages", nil];
    
    _navigationItems = [[NSMutableArray alloc] initWithCapacity:[navigationTitles count]];
    
    for (int i = 0; i < [navigationTitles count]; i++) {
        [_navigationItems addObject:[[_viewInfo alloc] initWithTitle:[navigationTitles objectAtIndex:i]
                                                          identifier:[navigationIdentifiers objectAtIndex:i]
                                                           imageName:[navigationIcons objectAtIndex:i]
                                                              index:i]];
    }
}

//fill data structures with information for each view in the trending section
- (void) initializeTrendingViewStructures {
    NSArray *trendingTitles = [NSArray arrayWithObjects:@"Trending Goals",
                               @"Trending Users", nil];
    NSArray *trendingIdentifiers = [NSArray arrayWithObjects:@"GoalsNavController",
                                    @"UsersNavController", nil];
    
    NSArray *trendingIcons = [NSArray arrayWithObjects:@"blue-trending-goals",
                              @"blue-trending-users", nil];
    
    _trending = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [trendingTitles count]; i++) {
        [_trending addObject:[[_viewInfo alloc] initWithTitle:[trendingTitles objectAtIndex:i]
                                                   identifier:[trendingIdentifiers objectAtIndex:i]
                                                    imageName:[trendingIcons objectAtIndex:i]
                                                        index:i]];
    }
}

//fill data struectures with information for each view in the help and settings section
- (void) initializeHelpAndSettingsViewStructures {
    NSArray *helpTitles = [NSArray arrayWithObjects:@"Settings",
                        @"Support",
                        @"Terms of Use",
                        @"Privacy Policy",
                        @"Log Out", nil];
    
    NSArray *helpIdentifiers = [NSArray arrayWithObjects:@"SettingsNavController",
                                                      @"SupportNavController",
                                                      @"TermsNavController",
                                                      @"PrivacyNavController",
                                                      @"LogOutController", nil];
    
    NSArray *helpIcons = [NSArray arrayWithObjects:@"edit",
                          @"blue-support",
                          @"blue-terms-of-use",
                          @"blue-privacy",
                          @"blue-log-out", nil];
    _helpAndSettings = [[NSMutableArray alloc] init];
    
    //initialize viewInfo objects
    for (int i = 0; i < [helpTitles count]; i++) {
        [_helpAndSettings addObject:[[_viewInfo alloc] initWithTitle:[helpTitles objectAtIndex:i]
                                                          identifier:[helpIdentifiers objectAtIndex:i]
                                                           imageName:[helpIcons objectAtIndex:i]
                                                               index:i]];
    }
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

//set title for table view headers
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

//set text and background color of table headers
- (void) tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    [view setTintColor:UIColorFromRGB(0x3d454f)];
    [[((UITableViewHeaderFooterView *)view) textLabel] setTextColor:UIColorFromRGB(0xDDEEFF)];
}


//set title and icon of each menu item in drawer
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VLDrawerTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DrawerCell" forIndexPath:indexPath];
    
    _viewInfo *viewInfo = nil;
    
    switch ([indexPath section]) {
        case VLDrawerSectionNavigationItems:
            viewInfo = [_navigationItems objectAtIndex:[indexPath row]];
            break;
        case VLDrawerSectionTrending:
            viewInfo = [_trending objectAtIndex:[indexPath row]];
            break;
        case VLDrawerSectionHelpAndSettings:
            viewInfo = [_helpAndSettings objectAtIndex:[indexPath row]];
            break;
    }

    [[cell titleLabel] setText:[viewInfo title]];
    [[cell icon] setImage:[UIImage imageNamed:[viewInfo imageName]]];
    return cell;
}


#pragma mark - TableViewDelegate methods
//call action for each menu item in the navigation drawer. changes center view controller
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UINavigationController *vc;
    
    NSMutableArray *dataSource = nil;
    switch ([indexPath section]) {
        case VLDrawerSectionNavigationItems:
            dataSource = _navigationItems;
            break;
        case VLDrawerSectionTrending:
            dataSource = _trending;
            break;
        case VLDrawerSectionHelpAndSettings:
            if ([indexPath row] == VLHelpRowLogOut) {
                //handle logout case
                dataSource = nil;
            } else {
                dataSource = _helpAndSettings;
            }
            break;
    }

    //set center view controller
    if (dataSource) {
        vc = [storyboard instantiateViewControllerWithIdentifier:[[dataSource objectAtIndex:indexPath.row] identifier]];
        [[[vc viewControllers] objectAtIndex:0] setTitle:[[dataSource objectAtIndex:indexPath.row] title]];
        [[self mm_drawerController] setCenterViewController:vc];
    }

    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    
}

- (void) tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    VLDrawerTableViewCell *cell = (VLDrawerTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell setBackgroundColor:UIColorFromRGB(0x222222)];
}

- (void) tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    VLDrawerTableViewCell *cell = (VLDrawerTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell setBackgroundColor:UIColorFromRGB(0x5d656f)];
}



@end
