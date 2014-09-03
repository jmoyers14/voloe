//
//  VLUserContest.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VLUserContest : NSObject
@property (nonatomic, readonly, strong) NSString *ID;
@property (nonatomic, readonly, strong) NSString *listItemID;
@property (nonatomic, readonly, strong) NSString *userID;
@property (nonatomic, readonly, strong) NSString *category;


//designated initializer
- (id) initWithID:(NSString *)ID
       listItemID:(NSString *)listItemID
           userID:(NSString *)userID
         categoey:(NSString *)category;

@end
