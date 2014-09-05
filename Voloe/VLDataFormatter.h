//
//  VLDataFormatter.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/5/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VLUser.h"
@interface VLDataFormatter : NSObject

+ (BOOL) boolFromString:(NSString *)string;
+ (VLGender) genderFromString:(NSString *)string;

+ (NSString *)boolToString:(BOOL)boolVal;
+ (NSString *)genderToString:(VLGender)gender;
@end
