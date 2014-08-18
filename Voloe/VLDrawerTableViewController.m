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
@end

@implementation _viewInfo
@synthesize title = _title;
@synthesize identifier = _identifier;
@synthesize index = _index;

//designated initializer
- (id) initWithTitle:(NSString *)title identifier:(NSString *)identifer index:(NSInteger)index {
    self = [super init];
    if (self) {
        [self setTitle:title];
        [self setIdentifier:identifer];
        [self setIndex:index];
    }
    return self;
}

- (id) init {
    //call designated initializer
    return [self initWithTitle:nil identifier:nil index:0];
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
    _navigationItems = [[NSMutableArray alloc] initWithCapacity:[navigationTitles count]];
    
    for (int i = 0; i < [navigationTitles count]; i++) {
        [_navigationItems addObject:[[_viewInfo alloc] initWithTitle:[navigationTitles objectAtIndex:i]
                                                          identifier:[navigationIdentifiers objectAtIndex:i]
                                                               index:i]];
    }
}

//fill data structures with information for each view in the trending section
- (void) initializeTrendingViewStructures {
    NSArray *trendingTitles = [NSArray arrayWithObjects:@"Trending Goals",
                               @"Trending Users", nil];
    NSArray *trendingIdentifiers = [NSArray arrayWithObjects:@"GoalsNavController",
                                    @"UsersNavController", nil];
    
    _trending = [[NSMutableArray alloc] init];
    for (int i = 0; i < [trendingTitles count]; i++) {
        [_trending addObject:[[_viewInfo alloc] initWithTitle:[trendingTitles objectAtIndex:i]
                                                   identifier:[trendingIdentifiers objectAtIndex:i]
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
    _helpAndSettings = [[NSMutableArray alloc] init];
    for (int i = 0; i < [helpTitles count]; i++) {
        [_helpAndSettings addObject:[[_viewInfo alloc] initWithTitle:[helpTitles objectAtIndex:i]
                                                          identifier:[helpIdentifiers objectAtIndex:i]
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
            title = [[_navigationItems objectAtIndex:[indexPath row]] title];
            break;
        case VLDrawerSectionTrending:
            title = [[_trending objectAtIndex:[indexPath row]] title];
            break;
        case VLDrawerSectionHelpAndSettings:
            title = [[_helpAndSettings objectAtIndex:[indexPath row]] title];
            break;
    }

    [[cell textLabel] setText:title];
    
    return cell;
}


#pragma mark - TableViewDelegate methods

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

    
}

@end
