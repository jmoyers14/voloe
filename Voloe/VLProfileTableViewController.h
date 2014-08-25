//
//  VLProfileTableViewController.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLProfileTableViewController : UITableViewController
@property (nonatomic, strong) IBOutlet UIImageView *profilePicture;
@property (nonatomic, strong) IBOutlet UIButton *goalsButton;
@property (nonatomic, strong) IBOutlet UIButton *goalsAchievedButton;
@property (nonatomic, strong) IBOutlet UIButton *assistsButton;
@property (nonatomic, strong) IBOutlet UIButton *friendsButton;
@property (nonatomic, strong) IBOutlet UIButton *followersButton;
@end
