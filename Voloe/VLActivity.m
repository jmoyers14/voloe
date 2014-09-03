//
//  VLActivity.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLActivity.h"

@implementation VLActivity




//designated initializer
- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id) init {
    return [self initWithID:nil];
}


- (id) initWithID:(NSString *)ID{
    self = [self initWithDictionary:nil];
    if (self) {
        _ID = ID;
    }
    return self;
}
@end
