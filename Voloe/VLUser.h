//
//  VLUser.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//
//
//  VLUser class is used for representing:
//  Main user - actor using the phone
//  Interaction users - other voloe community memembers
//


#import <Foundation/Foundation.h>
#import "VLListItem.h"
#import "VLUserLike.h"
#import "VLUserAssist.h"
#import "VLUserContest.h"
#import "VLFollower.h"
#import "VLActivity.h"
#import "VLNotification.h"

@interface VLUser : NSObject

//user attributes
@property (nonatomic, readonly, strong)  NSNumber *userId;
@property (nonatomic, readwrite, strong) NSString *bioText;
@property (nonatomic, readonly, strong)  NSDate *dateCreated;
@property (nonatomic, readwrite, strong) NSDate *dob;
@property (nonatomic, readwrite, strong) NSString *emailAddress;
@property (nonatomic, readwrite, strong) NSString *firstName;
@property (nonatomic, readwrite, strong) NSString *wholeName;
@property (nonatomic, readwrite, strong) NSString *zipcode;
@property (nonatomic, readwrite, strong) NSString *gender;
@property (nonatomic, readwrite, strong) NSString *location;
@property (nonatomic, readwrite, strong) NSString *mobile;
@property (nonatomic, readwrite, strong) NSString *profileImageKey;
@property (nonatomic, readwrite, strong) NSString *userAliasToken;
@property (nonatomic, readwrite, strong) NSString *userVerificationKey;



//user settings
@property (nonatomic, readwrite, assign) BOOL allowFollowers;
@property (nonatomic, readwrite, assign) BOOL allowFriendRequests;
@property (nonatomic, readwrite, assign) BOOL autoshareFacebook;
@property (nonatomic, readwrite, assign) BOOL hideDOB;
@property (nonatomic, readwrite, assign) BOOL hideLocation;
@property (nonatomic, readwrite, assign) BOOL isEmailFlagged;
@property (nonatomic, readwrite, assign) BOOL isVisitingFirstTime;

//relationship attributes
@property (nonatomic, readonly, strong) NSMutableArray *listItems;
@property (nonatomic, readonly, strong) NSMutableArray *contests;
@property (nonatomic, readonly, strong) NSMutableArray *followers;
@property (nonatomic, readonly, strong) NSMutableArray *activities;
@property (nonatomic, readonly, strong) NSMutableArray *notifications;

// user list items
- (void) addListItem:(VLListItem *)listItem;
- (NSInteger) listItemCount;
- (VLListItem *) listItemAtIndex:(NSInteger)index;
- (NSInteger) indexOfListItem:(VLListItem *)listItem;
- (void) deleteListItemAtIndex:(NSInteger)index;
- (void) deleteListItem:(VLListItem *)listItem;

// contests
- (void) addContest:(VLUserContest *)contest;
- (NSInteger) contestCount;
- (VLUserContest *) contestAtIndex:(NSInteger)index;
- (NSInteger) indexOfContest:(VLUserContest *)contest;
- (void) deleteContestAtIndex:(NSInteger)index;
- (void) deleteContest:(VLUserContest *)contest;

// followers
- (void) addFollower:(VLFollower *)follower;
- (NSInteger) folloerCount;
- (VLFollower *) followerAtIndex:(NSInteger)index;
- (NSInteger) indexOfFollower:(VLFollower *)follower;
- (void) deleteFollowerAtIndex:(NSInteger)index;
- (void) deleteFollower:(VLFollower *)follower;

// activites
- (void) addActivity:(VLActivity *)activity;
- (NSInteger) activityCount;
- (VLActivity *) activityAtIndex:(NSInteger)index;
- (NSInteger) indexOfActivity:(VLActivity *)activity;

#warning - can activities be deleted??
- (void) deleteActivityAtIndex:(NSInteger)index;
- (void) deleteActivity:(VLActivity *)activity;
// notifications

//database keys
+ (NSArray *) dbKeys;


//initializers

//designated initializer
- (id) initWithDictionary:(NSDictionary *)dictionary;



@end
