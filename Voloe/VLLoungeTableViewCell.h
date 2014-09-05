//
//  VLLoungeTableViewCell.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/4/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLActivity.h"

@interface VLLoungeTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *profileImageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *actionLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeStampLabel;
@property (nonatomic, strong) IBOutlet UILabel *likeButton;
@property (nonatomic, strong) IBOutlet UIButton *commentButton;
@property (nonatomic, strong) IBOutlet UIButton *messageButton;

@property (nonatomic, strong) IBOutlet UIView *imageContainerView;

@property (nonatomic, strong) VLActivity *activity;



@end
