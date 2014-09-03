//
//  VLUserTests.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VLUser.h"
@interface VLUserTests : XCTestCase

@end

@implementation VLUserTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}



#pragma mark - ListItem relation tests
- (void) testAddListItem {
    VLUser *user = [[VLUser alloc] init];
    
    VLListItem *listItem1 = [[VLListItem alloc] init];
    VLListItem *listItem2 = [[VLListItem alloc] init];

    [user addListItem:listItem1];
    [user addListItem:listItem2];
    
    XCTAssertTrue([[user listItems] count] == 2, @"Two list items should be in array");
}

- (void) testListItemDoubleAdd {
    VLUser *user = [[VLUser alloc] init];
    VLListItem *listItem = [[VLListItem alloc] init];
    
    [user addListItem:listItem];
    [user addListItem:listItem];
    
    XCTAssertTrue([[user listItems] count] == 1, @"%s: only 1 list item no crash", __PRETTY_FUNCTION__);
}

- (void) testNilListItem {
    VLUser *user = [[VLUser alloc] init];
    [user addListItem:nil];
    XCTAssertTrue([[user listItems] count] == 0, @"list items count should be 0, app shouldn't crash");
}

- (void) testDeleteListItemAtIndex {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    
    [user deleteListItemAtIndex:5];
    
    XCTAssertFalse([[[[user listItems] objectAtIndex:5] title] isEqualToString:@"Title5"], @"%s title should not equal Title5", __PRETTY_FUNCTION__);
}

- (void) testDeleteAllListItems {
    
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    
    for (int i = 0; i < 10; i++) {
        [user deleteListItemAtIndex:0];
    }
    
    XCTAssertTrue([[user listItems] count] == 0, @"%s: list item count should be 0", __PRETTY_FUNCTION__);
}

- (void) testListItemCount {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    
    XCTAssertTrue([user listItemCount] == 10, @"%s, listITemCount should be 10", __PRETTY_FUNCTION__);
}

- (void) testListItemZeroCount {
    VLUser *user = [[VLUser alloc] init];
    XCTAssertTrue([user listItemCount] == 0, @"%s: listItemCount for new user should be 0", __PRETTY_FUNCTION__);
}

- (void) testListItemAtIndex {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    
    XCTAssertTrue([[[[user listItems] objectAtIndex:4] title] isEqualToString:@"Title4"], @"%s: object at index 4", __PRETTY_FUNCTION__);
}

- (void) testListItemAtIndexOutOfBounds {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    XCTAssertTrue([user listItemAtIndex:12] == nil, @"%s: should return nil and not crash", __PRETTY_FUNCTION__);
}

- (void) testIndexOfListItem {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    VLListItem *needle = [[user listItems] objectAtIndex:4];
    XCTAssertTrue([user indexOfListItem:needle] == 4, @"%s: index of list item should be 4", __PRETTY_FUNCTION__);
}

- (void) testIndexOfListItemNil {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    XCTAssertTrue([user indexOfListItem:nil] == NSNotFound, @"%s: index nil should be not found", __PRETTY_FUNCTION__);
}

- (void) testIndexOfListItemNotFound {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    VLListItem *needle = [[VLListItem alloc] initWithID:@"CrazyValue" andTitle:@"CrazyTitle"];
    XCTAssertTrue([user indexOfListItem:needle] == NSNotFound, @"%s: listItem should not be found. no crash", __PRETTY_FUNCTION__);
}

- (void) testDeleteListItem {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    VLListItem *needle = [[user listItems] objectAtIndex:4];
    [user deleteListItem:needle];
    
    XCTAssertFalse([[user listItems] containsObject:needle], @"%s: listItems should not contain needle", __PRETTY_FUNCTION__);
    
}

- (void) testDeleteListItemNil {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    [user deleteListItem:nil];
    
    XCTAssertFalse([[user listItems] count] == 25, @"%s: listItem count should be 25 no crash", __PRETTY_FUNCTION__);
}

#pragma mark - Contest relation tests

- (void) testAddContest {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([[user contests] count] == 10, @"%s: contests count should be 10", __PRETTY_FUNCTION__);
    
}

- (void) testAddContestDoubleAdd {
    VLUser *user = [[VLUser alloc] init];
    
    VLUserContest *contest = [[VLUserContest alloc] initWithID:@"1" listItemID:@"item" userID:@"id" categoey:@"cat"];
    
    [user addContest:contest];
    [user addContest:contest];
    
    XCTAssertTrue([[user contests] count] == 1, @"%s: contest count should be 1 no crash", __PRETTY_FUNCTION__);
}

- (void) testDeleteContestAtIndex {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    
    [user deleteContestAtIndex:5];
    
    XCTAssertTrue([[[[user contests] objectAtIndex:5] category] isEqualToString:@"6"], @"%s: contest at index 5 should be gone", __PRETTY_FUNCTION__);
}

- (void) testDeleteContestAtIndexOutOfBounds {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    [user deleteContestAtIndex:15];
    
    XCTAssertTrue([[user contests] count] == 10, @"%s: countest count should be 10. no crash", __PRETTY_FUNCTION__);
}

- (void) testDeleteContestNotFound {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLUserContest *needle = [[VLUserContest alloc] init];
    
    [user deleteContest:needle];
    XCTAssertTrue([[user contests] count] == 10, @"%s: countest count should be 10. no crash", __PRETTY_FUNCTION__);
}

- (void) testContestCount {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([user contestCount] == 10, @"%s: contest count shoudl equal 10", __PRETTY_FUNCTION__);
}

- (void) testContestAtIndex {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLUserContest *contest = [[user contests] objectAtIndex:4];
    
    XCTAssertTrue([[[user contestAtIndex:4] category] isEqualToString:[contest category]], @"%s: contest at index 4 should be equal", __PRETTY_FUNCTION__);
}

- (void) testContestAtIndexOutOfBounds {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([user contestAtIndex:25] == nil, @"%s, index 25 should be nil. no crash", __PRETTY_FUNCTION__);
}

- (void) testIndexOfContest {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLUserContest *needle = [[user contests] objectAtIndex:5];
    
    XCTAssertTrue([user indexOfContest:needle] == 5, @"%s, index of needle should be 5", __PRETTY_FUNCTION__);
}

- (void) testIndexOfContestNotFound {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [user addContest:[[VLUserContest alloc] initWithID:[NSString stringWithFormat:@"%d", i]
                                                listItemID:[NSString stringWithFormat:@"%d", i]
                                                    userID:[NSString stringWithFormat:@"%d", i]
                                                  categoey:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLUserContest *needle = [[VLUserContest alloc] initWithID:@"34" listItemID:@"item" userID:@"who knows" categoey:@"not me"];
    
    XCTAssertTrue([user indexOfContest:needle] == NSNotFound, @"%s, index of needle should be NSNotFound", __PRETTY_FUNCTION__);
}

#pragma mark - Followers

- (void) testAddFollower {
    VLUser *user = [[VLUser alloc] init];

    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([[user followers] count] == 25, @"%s: contests count should be 25", __PRETTY_FUNCTION__);
}

- (void) testFollowerDoubleAdd {
    VLUser *user = [[VLUser alloc] init];
    VLFollower *follower = [[VLFollower alloc] initWithFollowingUserAliasToken:@"one" followingUserID:@"two" follwingUserProfileImageKey:@"key" followingUserWholeName:@"name"];
    
    [user addFollower:follower];
    [user addFollower:follower];
    
    XCTAssertTrue([[user followers] count] == 1, @"%s: follower count should be one no crash", __PRETTY_FUNCTION__);
}

- (void) testAddNilFollower {
    VLUser *user = [[VLUser alloc] init];
    [user addFollower:nil];
    XCTAssertTrue([[user contests] count] == 0, @"%s: contests count sohuld be 0. no crash", __PRETTY_FUNCTION__);
}

- (void) testDeleteFollowerAtIndex {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    [user deleteFollowerAtIndex:15];
    
    XCTAssertTrue(([[user followers] count] == 24) && [[[[user followers] objectAtIndex:15] followingUserID] isEqualToString:@"16"], @"%s: follower ID 15 should be removed reducing follower count to 24", __PRETTY_FUNCTION__);
        
}

- (void) testDeleteFollowerOutOfBounds {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    [user deleteFollowerAtIndex:400];
    
    XCTAssertTrue([[user followers] count] == 25, @"%s: followers count should be 25. no crash", __PRETTY_FUNCTION__);
}

- (void) testDeleteFollowersFromBeginning {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    [user deleteFollowerAtIndex:0];
    
    XCTAssertTrue(([[user followers] count] == 24) && [[[[user followers] objectAtIndex:0] followingUserID] isEqualToString:@"1"], @"%s: follower ID 15 should be removed reducing follower count to 24", __PRETTY_FUNCTION__);
}

- (void) testDeleteFollowersFromEnd {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    [user deleteFollowerAtIndex:24];
    
    XCTAssertTrue([[user followers] count] == 24, @"%s, followers count should be 24", __PRETTY_FUNCTION__);
}

- (void) testDeleteFollower {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
}

- (void) testDeleteFollowerNotFound {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
}

- (void) testFollowersCount {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
}

- (void) testFollowerAtIndex {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLFollower *needle = [[user followers] objectAtIndex:10];
    
    XCTAssertTrue([[needle followingUserID] isEqualToString:[[user followerAtIndex:10] followingUserID]], @"%s: needle shoud equal follower at index 10", __PRETTY_FUNCTION__);
}

- (void) testFollowerAtIndexOutOfBounds {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([user followerAtIndex:55] == nil, @"%s: index 55 returns nil. no crash", __PRETTY_FUNCTION__);
}

- (void) testIndexOfFollower {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLFollower *needle = [[user followers] objectAtIndex:13];
    
    XCTAssertTrue([user indexOfFollower:needle] == 13, @"%s: index of follower should equal 13", __PRETTY_FUNCTION__);
}

- (void) testIndexOfFollowerNotFound {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25 ; i++) {
        [user addFollower:[[VLFollower alloc] initWithFollowingUserAliasToken:[NSString stringWithFormat:@"%d", i]
                                                              followingUserID:[NSString stringWithFormat:@"%d", i]
                                                  follwingUserProfileImageKey:[NSString stringWithFormat:@"%d", i]
                                                       followingUserWholeName:[NSString stringWithFormat:@"%d", i]]];
    }
    
    
    VLFollower *needle = [[VLFollower alloc] init];
    XCTAssertTrue([user indexOfFollower:needle] == NSNotFound, @"%s: index of needle should be NSNotFound", __PRETTY_FUNCTION__ );
}

#pragma mark - Activities

- (void) testAddActivity {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] init]];
    }
    
    XCTAssertTrue([[user activities] count] == 25, @"%s: activities count should be 25", __PRETTY_FUNCTION__);
}

- (void) testActivityDoubleAdd {
    VLUser *user = [[VLUser alloc] init];
    VLActivity *act = [[VLActivity alloc] initWithID:@"1"];
    
    [user addActivity:act];
    [user addActivity:act];
    
    XCTAssertTrue([[user activities] count] == 1, @"%s: activities count should be 1", __PRETTY_FUNCTION__);
}

- (void) testAddNilActivity {
    VLUser *user = [[VLUser alloc] init];
    [user addActivity:nil];
    XCTAssertTrue([[user activities] count] == 0, @"%s: activity count should be 0. no crash", __PRETTY_FUNCTION__);
}

- (void) testActivityCount {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([user activityCount] == 25, @"%s: activity count should be 25", __PRETTY_FUNCTION__);
}

- (void) testActivityAtIndex {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLActivity *activity = [[user activities] objectAtIndex:10];
    
    XCTAssertTrue([[activity ID] isEqualToString:[[user activityAtIndex:10] ID]], @"%s: Ids of activity at index 10 should be same", __PRETTY_FUNCTION__);
    

}

- (void) testActivityAtBeginning {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    VLActivity *activity = [[user activities] objectAtIndex:0];
    
    XCTAssertTrue([[activity ID] isEqualToString:[[user activityAtIndex:0] ID]], @"%s: Ids of activity at index 0 should be same", __PRETTY_FUNCTION__);
    
}

- (void) testActivityAtEnd {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    VLActivity *activity = [[user activities] objectAtIndex:24];
    
    XCTAssertTrue([[activity ID] isEqualToString:[[user activityAtIndex:24] ID]], @"%s: Ids of activity at index 25 should be same", __PRETTY_FUNCTION__);
}

- (void) testActivityAtIndexOutOfBounds {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    
    XCTAssertTrue([user activityAtIndex:55] == nil, @"%s: activity index out of bounds return nil no crash", __PRETTY_FUNCTION__);

}

- (void) testIndexOfActivity {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLActivity *activity = [[user activities] objectAtIndex:10];

    XCTAssertTrue([user indexOfActivity:activity] == 10, @"%s: activity at index 10 should hav eindex 10", __PRETTY_FUNCTION__);
}

- (void) testIndexOfActivityNotFound {
    VLUser *user = [[VLUser alloc] init];
    
    for (int i = 0; i < 25; i++) {
        [user addActivity:[[VLActivity alloc] initWithID:[NSString stringWithFormat:@"%d", i]]];
    }
    
    VLActivity *activity = [[VLActivity alloc] initWithID:@"1000"];
    
    XCTAssertTrue([user indexOfActivity:activity] == NSNotFound, @"%s: activity should not be found", __PRETTY_FUNCTION__);
}



- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
