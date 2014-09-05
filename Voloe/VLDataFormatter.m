//
//  VLDataFormatter.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/5/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLDataFormatter.h"

@implementation VLDataFormatter


+ (BOOL) boolFromString:(NSString *)string {
    if (string) {
        if ([string caseInsensitiveCompare:@"yes"] == NSOrderedSame) {
            return YES;
        }
        
        if ([string caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return NO;
        }
        
        NSLog(@"%s:, string did not match yes or no. returning no default", __PRETTY_FUNCTION__);
        return NO;
    } else {
        NSLog(@"%s: string is nil", __PRETTY_FUNCTION__);
        return NO;
    }
}

+ (VLGender) genderFromString:(NSString *)string {
    
    if (string) {
        if ([string caseInsensitiveCompare:@"m"] == NSOrderedSame) {
            return VLGenderMale;
        }
        
        if ([string caseInsensitiveCompare:@"f"] == NSOrderedSame) {
            return VLGenderFemale;
        }
        
        if ([string caseInsensitiveCompare:@"o"] == NSOrderedSame) {
            return VLGenderOther;
        }
        
        NSLog(@"%s: no nil string did not match with male, female, or other. no returned as default.", __PRETTY_FUNCTION__);
        return NO;
    } else {
        NSLog(@"%s: string is nil. returned no", __PRETTY_FUNCTION__);
        return NO;
    }
    
    
    
}

+ (NSString *) boolToString:(BOOL)boolVal {
    if (boolVal) {
        return @"yes";
    } else {
        return @"no";
    }
}

+ (NSString *) genderToString:(VLGender)gender {
    NSString *genderString = nil;
    switch (gender) {
        case VLGenderMale:
            genderString = @"M";
            break;
            
        case VLGenderFemale:
            genderString = @"F";
            break;
        
        case VLGenderOther:
            genderString = @"O";
            break;
    }
    
    return genderString;
}

@end
