//
//  VLUser.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//
//
//  The VLUser class is the core data model for the voloe mobile app.
//  Access to all other data models can be accessed through the shared VLUser instance
//  The VLUser instance is to be created at application launch after login


#import <Foundation/Foundation.h>

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



//user model relations





//singleton methods.
//only one user per application, provides acce
+ (id) sharedInstance;
+ (BOOL) sharedInstanceExists;

@end
