//
//  VLListItemView.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/2/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLListItemView.h"
#import "VLColorManager.h"
@implementation VLListItemView
@synthesize likesLabel = _likesLabel;
@synthesize commentsLabel = _commentsLabel;
@synthesize imageView = _imageView;
@synthesize titleLable = _titleLable;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
}


- (void) setTitle:(NSString *)title {
    if (title) {
        [[self titleLable] setText:title];
    } else {
        NSLog(@"setTitle: nil title");
    }
}

- (void) setComments:(NSInteger)comments {
    if (comments >=0 ) {
        [[self commentsLabel] setText:[NSString stringWithFormat:@"%lu", (unsigned long)comments]];
    } else {
        NSLog(@"setComments:negative comment value");
    }
}

- (void) setLikes:(NSInteger)likes {
    if (likes >= 0) {
        [[self likesLabel] setText:[NSString stringWithFormat:@"%lu", (unsigned long)likes]];
    } else {
        NSLog(@"setLikes: negative likes value");
    }
}

- (void) setImage:(UIImage *)image {
    if (image) {
        [[self imageView] setImage:image];
    } else {
        NSLog(@"setImage: nil image value");
    }
}

- (void) setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        [self setBackgroundColor:[[VLColorManager sharedInstance] colorForKey:@"ListItemGridViewSelectedBG"]];
    } else {
        [self setBackgroundColor:[[VLColorManager sharedInstance] colorForKey:@"ListItemGridViewBG"]];
    }
}

@end
