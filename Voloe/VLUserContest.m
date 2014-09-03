//
//  VLUserContest.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLUserContest.h"

@implementation VLUserContest

//designated initializer
- (id) initWithID:(NSString *)ID
       listItemID:(NSString *)listItemID
           userID:(NSString *)userID
         categoey:(NSString *)category {
    self = [super init];
    if (self) {
        _ID = ID;
        _listItemID = listItemID;
        _userID = userID;
        _category = category;
    }
    return self;
}

- (id) init {
    //call designated initializer
    return [self initWithID:nil listItemID:nil userID:nil categoey:nil];
}


@end
