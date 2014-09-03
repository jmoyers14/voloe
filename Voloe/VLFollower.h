//
//  VLFollower.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VLFollower : NSObject

@property (nonatomic, readonly, strong) NSString *followingUserAliasToken;
@property (nonatomic, readonly, strong) NSString *followingUserID;
@property (nonatomic, readonly, strong) NSString *followingUserProfileImageKey;
@property (nonatomic, readonly, strong) NSString *followingUserWholeName;

//duplicate data.. probably wont use
@property (nonatomic, readonly, strong) NSString *userAliasToken;
@property (nonatomic, readonly, strong) NSString *userID;
@property (nonatomic, readonly, strong) NSString *userProfileImageKey;
@property (nonatomic, readonly, strong) NSString *userWholeName;



//designated initializer
- (id) initWithFollowingUserAliasToken:(NSString *)fuAliasToken
                       followingUserID:(NSString *)fuID
           follwingUserProfileImageKey:(NSString *)fuImageKey
                followingUserWholeName:(NSString *)fuWholeName;


@end
