//
//  VLLoungeTableViewCell.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/4/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLLoungeTableViewCell.h"


@implementation VLLoungeTableViewCell
@synthesize nameLabel      = _nameLabel;
@synthesize actionLabel    = _actionLabel;
@synthesize timeStampLabel = _timeStampLabel;
@synthesize likeButton     = _likeButton;
@synthesize commentButton  = _commentButton;
@synthesize messageButton  = _messageButton;

@synthesize imageContainerView = _imageContainerView;
@synthesize activity = _activity;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setActivity:(VLActivity *)activity {
    _activity = activity;
    
    [_nameLabel setText:[activity userWholeName]];
    [_actionLabel setText:[activity description]];
    [_likeButton setText:[activity likes]];
}


@end
