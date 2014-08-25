//
//  VLGridListTableViewCell.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/25/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLGridListTableViewCell.h"

@implementation VLGridListTableViewCell
@synthesize colOneImage = _colOneImage;
@synthesize colTwoImage = _colTwoImage;
@synthesize colThreeImage = _colThreeImage;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
