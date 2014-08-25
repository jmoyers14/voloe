
//
//  VLColorManager.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/22/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLColorManager.h"

@implementation VLColorManager



static VLColorManager *myInstance = nil;
NSMutableDictionary *_colors;

+ (VLColorManager *) sharedInstance {
    if (!myInstance) {
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            myInstance = [[[self class] alloc] init];
            _colors = [[NSMutableDictionary alloc] init];
        });
    }
    return myInstance;
}

+ (BOOL) sharedInstanceExists {
    return (nil != myInstance);
}

//retrieve color from directory
- (UIColor *) colorForKey:(NSString *)key {
    UIColor *color = [_colors objectForKey:key];
    if (color) {
        return color;
    } else {
        NSLog(@"color for key:%@ not found", key);
        return nil;
    }
}

//add color to directory
- (void) setColor:(UIColor *)color forKey:(NSString *)key {
    [_colors setObject:color forKey:key];
}


@end
