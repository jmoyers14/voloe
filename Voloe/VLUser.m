//
//  VLUser.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLUser.h"

@implementation VLUser


static VLUser *myInstance = nil;
/*
NSMutableArray *_listItems;
NSMutableArray *_contests;
NSMutableArray *_followers;
NSMutableArray *_activities;
NSMutableArray *_notifications;
 */

@synthesize listItems     = _listItems;
@synthesize contests      = _contests;
@synthesize followers     = _followers;
@synthesize activities    = _activities;
@synthesize notifications = _notifications;

//designated initializer
- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _listItems     = [[NSMutableArray alloc] init];
        _contests      = [[NSMutableArray alloc] init];
        _followers     = [[NSMutableArray alloc] init];
        _activities    = [[NSMutableArray alloc] init];
        _notifications = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) init {
    return [self initWithDictionary:nil];
}

#pragma mark - listItems
//add a list item to list items collection
- (void) addListItem:(VLListItem *)listItem {
    if (listItem) {
        if ([listItem isKindOfClass:[VLListItem class]]) {
            [_listItems addObject:listItem];
        } else {
            NSLog(@"%s: listItem is %@", __PRETTY_FUNCTION__, [listItem class]);
        }
    } else {
        NSLog(@"VLUser addListItem: item is nil");
    }
}

- (NSInteger) indexOfListItem:(VLListItem *)listItem {
    return NSNotFound;
}

@end
