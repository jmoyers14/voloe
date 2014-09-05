//
//  VLActivity.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VLActivity : NSObject

@property (nonatomic, readonly, strong) NSString *ID;
@property (nonatomic, readonly, strong) NSString *userID;
@property (nonatomic, readonly, strong) NSDate   *dateEntered;
@property (nonatomic, readonly, strong) NSString *listItemID;
@property (nonatomic, readonly, strong) NSString *commentedByProfilePhotoImageKey;
@property (nonatomic, readonly, strong) NSString *commentedByUserID;
@property (nonatomic, readonly, strong) NSString *description;
@property (nonatomic, readonly, strong) NSString *imageID;
@property (nonatomic, readonly, strong) NSString *likes;
@property (nonatomic, readonly, strong) NSString *profilePhotoImageKey;
@property (nonatomic, readonly, strong) NSString *thumbnailImageKey;
@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *userAliasToken;
@property (nonatomic, readonly, strong) NSString *userWholeName;


- (id) initWithID:(NSString *)ID;

//designated initializer. dictionary required to have all keys
- (id) initWithDictionary:(NSDictionary *)dictionary;

@end
