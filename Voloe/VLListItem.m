//
//  VLListItem.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLListItem.h"

@implementation VLListItem
@synthesize ID = _ID;
@synthesize title = _title;

- (id) initWithID:(NSString *)ID andTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        _title = title;
        _ID    = ID;
    }
    
    return self;
}

- (id) init {
    //call designated initializer
    return [self initWithID:nil andTitle:nil];
}

@end
