//
//  VLFollower.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLFollower.h"

@implementation VLFollower


//designated initializer
- (id) initWithFollowingUserAliasToken:(NSString *)fuAliasToken
                       followingUserID:(NSString *)fuID
           follwingUserProfileImageKey:(NSString *)fuImageKey
                followingUserWholeName:(NSString *)fuWholeName {
    self = [super init];
    if (self) {
        _followingUserAliasToken = fuAliasToken;
        _followingUserID = fuID;
        _followingUserProfileImageKey = fuImageKey;
        _followingUserWholeName = fuWholeName;
    }
    return self;
}

//call to designated initializer
- (id) init {
    return [self initWithFollowingUserAliasToken:nil followingUserID:nil follwingUserProfileImageKey:nil followingUserWholeName:nil];
}

@end
