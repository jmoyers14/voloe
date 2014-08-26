//
//  VLEditProfileTableViewController.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/26/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLEditProfileTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *firstNameField;
@property (nonatomic, strong) IBOutlet UITextField *lastNameField;
@property (nonatomic, strong) IBOutlet UITextField *birthdayField;
@property (nonatomic, strong) IBOutlet UITextField *genderField;
@property (nonatomic, strong) IBOutlet UITextField *locationField;

@property (nonatomic, strong) IBOutlet UISwitch *genderSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *locationSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *birthdaySwitch;

- (IBAction)cancel:(id)sender;

@end
