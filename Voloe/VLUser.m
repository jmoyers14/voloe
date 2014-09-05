//
//  VLUser.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLUser.h"

@implementation VLUser


@synthesize listItems     = _listItems;
@synthesize contests      = _contests;
@synthesize followers     = _followers;
@synthesize activities    = _activities;
@synthesize notifications = _notifications;


//giant initializer with ever field
- (id) initWithID:(NSString *)ID
          bioText:(NSString *)bioText
     emailAddress:(NSString *)emailAddress
        firstName:(NSString *)firstName
         lastName:(NSString *)lastName
        wholeName:(NSString *)wholeName
          zipcode:(NSString *)zipcode
           gender:(VLGender)gender
         location:(NSString *)location
           mobile:(NSString *)mobile
  profileImageKey:(NSString *)profileImageKey
   userAliasToken:(NSString *)userAliasToken
userVerificationKey:(NSString *)userVerficationKey
  allowsFollowers:(BOOL)allowFollowers
allowsFriendRequests:(BOOL)allowFriendRequests
autoshareFacebook:(BOOL)autoshareFacebook
          hideDOB:(BOOL)hideDOB
     hideLocation:(BOOL)hideLocation
   isEmailFlagged:(BOOL)isEmailFlagged
isVisitingFirstTime:(BOOL)isVisitingFirstTime {
    
    self = [self initWithEmail:emailAddress];
    
    if (self) {
        _bioText             = bioText;
        _lastName            = lastName;
        _firstName           = firstName;
        _wholeName           = wholeName;
        _zipcode             = zipcode;
        _gender              = gender;
        _location            = location;
        _mobile              = mobile;
        _profileImageKey     = profileImageKey;
        _userAliasToken      = userAliasToken;
        _userVerificationKey = userVerficationKey;
        _allowFollowers      = allowFollowers;
        _allowFriendRequests = allowFriendRequests;
        _autoshareFacebook   = autoshareFacebook;
        _hideDOB             = hideDOB;
        _hideLocation        = hideLocation;
        _isEmailFlagged      = isEmailFlagged;
        _isVisitingFirstTime = isVisitingFirstTime;
    }
    return self;
}




//designated initializer
- (id) initWithEmail:(NSString *)email {
    self = [super init];
    if (self) {
        _emailAddress  = email;
        _listItems     = [[NSMutableArray alloc] init];
        _contests      = [[NSMutableArray alloc] init];
        _followers     = [[NSMutableArray alloc] init];
        _activities    = [[NSMutableArray alloc] init];
        _notifications = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) init {
    return [self initWithEmail:nil];
}

+ (NSArray *) dbKeys {
    return [NSArray arrayWithObjects:@"", nil];
};

#pragma mark - listItems

//return number of list items
- (NSInteger) listItemCount {
    return [_listItems count];
}

//add a list item to list items collection
- (void) addListItem:(VLListItem *)listItem {
    if (listItem) {
        if (![_listItems containsObject:listItem]) {
            [_listItems addObject:listItem];
        } else {
            NSLog(@"%s: duplicate list item %@", __PRETTY_FUNCTION__, [listItem class]);
        }
    } else {
        NSLog(@"VLUser addListItem: item is nil");
    }
}

//return the index of the specified list item
- (NSInteger) indexOfListItem:(VLListItem *)listItem {
    return [_listItems indexOfObject:listItem];
}

//remove list item specified by index
- (void) deleteListItemAtIndex:(NSInteger)index {
    if (index < [_listItems count] && index >= 0) {
        [_listItems removeObjectAtIndex:index];
    } else {
        NSLog(@"%s: index out of bounds", __PRETTY_FUNCTION__);
    }
}

//remove specified list item
- (void) deleteListItem:(VLListItem *)listItem {
    [_listItems removeObject:listItem];
}

//return list item specified by index
- (VLListItem *) listItemAtIndex:(NSInteger)index {
    if (index < [_listItems count] && index >= 0) {
        return [_listItems objectAtIndex:index];
    } else {
        NSLog(@"%s, index out of boudns", __PRETTY_FUNCTION__);
        return nil;
    }
}

#pragma mark - UserContests

- (NSInteger) contestCount {
    return [_contests count];
}

//add contest to users collection
- (void) addContest:(VLUserContest *)contest {
    if (contest) {
        if (![_contests containsObject:contest]) {
            [_contests addObject:contest];
        } else {
            NSLog(@"%s: contest already exists for user", __PRETTY_FUNCTION__);
        }
    } else {
        NSLog(@"%s: contest in nil", __PRETTY_FUNCTION__);
    }
}

//remove a contest specified by index
- (void) deleteContestAtIndex:(NSInteger)index {
    if (index < [_contests count] && index >= 0) {
        [_contests removeObjectAtIndex:index];
    } else {
        NSLog(@"%s: index out of bounds", __PRETTY_FUNCTION__);
    }
}

//returns a contest specified by index
- (VLUserContest *) contestAtIndex:(NSInteger)index {
    if (index < [_contests count] && index >= 0) {
        return [_contests objectAtIndex:index];
    } else {
        NSLog(@"%s: index out of bounds", __PRETTY_FUNCTION__);
        return nil;
    }
}

- (NSInteger) indexOfContest:(VLUserContest *)contest {
    return [_contests indexOfObject:contest];
}

- (void) deleteContest:(VLUserContest *)contest {
    [_contests removeObject:contest];
}

#pragma mark - Followers

- (NSInteger) followerCount {
    return [_followers count];
}

- (void) addFollower:(VLFollower *)follower {
    if (follower) {
        if (![_followers containsObject:follower]) {
            [_followers addObject:follower];
        }
    } else {
        NSLog(@"%s: followe is nil", __PRETTY_FUNCTION__);
    }
}

- (void) deleteFollowerAtIndex:(NSInteger)index {
    if (index < [_followers count] && index >=0) {
        [_followers removeObjectAtIndex:index];
    } else {
        NSLog(@"%s: index out of bounds", __PRETTY_FUNCTION__);
    }
}

- (void) deleteFollower:(VLFollower *)follower {
    [_followers removeObject:follower];
}

- (NSInteger) indexOfFollower:(VLFollower *)follower {
    return [_followers indexOfObject:follower];
}

- (VLFollower *)followerAtIndex:(NSInteger)index {
    if (index < [_followers count] && index > 0) {
        return [_followers objectAtIndex:index];
    } else {
        NSLog(@"%s: index out of bounds", __PRETTY_FUNCTION__);
        return nil;
    }
}

#pragma mark - activities

- (NSInteger) activityCount {
    return [_activities count];
}


- (void) addActivity:(VLActivity *)activity {
    if (activity) {
        if (![_activities containsObject:activity]) {
            [_activities addObject:activity];
        } else {
            NSLog(@"%s: duplicate activity", __PRETTY_FUNCTION__);
        }
    } else {
        NSLog(@"%s: activity is nil", __PRETTY_FUNCTION__);
    }
}

- (NSInteger) indexOfActivity:(VLActivity *)activity {
    return [_activities indexOfObject:activity];
}

- (VLActivity *) activityAtIndex:(NSInteger)index {
    if (index < [_activities count] && index >= 0) {
        return [_activities objectAtIndex:index];
    } else {
        NSLog(@"%s: index out of bounds", __PRETTY_FUNCTION__);
        return nil;
    }
}





































@end
