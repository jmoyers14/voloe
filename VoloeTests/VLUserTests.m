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

- (void) testListItemWrongClass {
    VLUser *user = [[VLUser alloc] init];
    VLNotification *notification = [[VLNotification alloc] init];
    [user addListItem:notification];
    XCTAssertTrue([[user listItems] count] == 0, @"list item should be rejected");
    
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
    
    XCTAssertTrue([[[[user listItems] objectAtIndex:4] title] isEqualToString:@"Title5"], @"%s: object at index 4", __PRETTY_FUNCTION__);
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

- (void) testIndexOfListItemNotFound {
    VLUser *user = [[VLUser alloc] init];
    for (int i = 0; i < 10; i++) {
        [user addListItem:[[VLListItem alloc] initWithID:[NSString stringWithFormat:@"%d", i] andTitle:[NSString stringWithFormat:@"Title%d", i]]];
    }
    VLListItem *needle = [[VLListItem alloc] initWithID:@"CrazyValue" andTitle:@"CrazyTitle"];
    XCTAssertTrue([user indexOfListItem:needle] == NSNotFound, @"%s: listItem should not be found. no crash", __PRETTY_FUNCTION__);
}


#pragma mark - Contest relation tests

- (void) testAddContest {
    
}

- (void) testDeleteContestAtIndex {
    
}

- (void) testDeleteContestAtIndexOutOfBounds {
    
}

- (void) testDeleteContestNotFound {
    
}

- (void) testContestCount {
    
}

- (void) testContestAtIndex {
    
}

- (void) testContestAtIndexOutOfBounds {
    
}

- (void) testIndexOfContest {
    
}

- (void) testIndexOfContestNotFound {
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
