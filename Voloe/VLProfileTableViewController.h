//
//  VLProfileTableViewController.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLProfileTableViewController : UITableViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) IBOutlet UIImageView *profilePicture;
@property (nonatomic, strong) IBOutlet UIButton *goalsButton;
@property (nonatomic, strong) IBOutlet UIButton *goalsAchievedButton;
@property (nonatomic, strong) IBOutlet UIButton *assistsButton;
@property (nonatomic, strong) IBOutlet UIButton *friendsButton;
@property (nonatomic, strong) IBOutlet UIButton *followersButton;

@property (nonatomic, strong) IBOutlet UIButton *orderButton;
@property (nonatomic, strong) IBOutlet UIButton *allButton;
@property (nonatomic, strong) IBOutlet UIButton *achievedButton;
@property (nonatomic, strong) IBOutlet UIButton *toBeButton;

- (IBAction)editProfile:(id)sender;
- (IBAction)toggleSort:(id)sender;

@end
