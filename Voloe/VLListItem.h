//
//  VLListItem.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/3/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VLListItem : NSObject

@property (nonatomic, strong) NSString *ID;

@property (nonatomic, readwrite, strong) NSString *awardStatus;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *sortKey;
@property (nonatomic, assign) BOOL isCompleted;
@property (nonatomic, strong) NSNumber *likes;
@property (nonatomic, strong) NSString *thumbnailImageKey;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userId;

@property (nonatomic, readonly, strong) NSDate *dateComplete;
@property (nonatomic, readonly, strong) NSDate *dateEntered;


//initializers

//designated initializer
- (id) initWithID:(NSString *)ID andTitle:(NSString *)title;



@end
