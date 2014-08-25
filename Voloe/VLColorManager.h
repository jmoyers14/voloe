//
//  VLColorManager.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/22/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface VLColorManager : NSObject


+ (id) sharedInstance;
+ (BOOL) sharedInstanceExists;

- (UIColor *) colorForKey:(NSString *)key;
- (void) setColor:(UIColor *)color forKey:(NSString *)key;
@end
