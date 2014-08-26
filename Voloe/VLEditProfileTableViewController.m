//
//  VLEditProfileTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/26/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLEditProfileTableViewController.h"

@interface VLEditProfileTableViewController () {
    NSArray *_genders;
    UIDatePicker *_datePicker;
}
@end

typedef NS_ENUM(NSInteger, PickerRow) {
    PickerRowMale,
    PickerRowFemale,
    PickerRowOther
};

@implementation VLEditProfileTableViewController
@synthesize firstNameField = _firstNameField;
@synthesize lastNameField  = _lastNameField;
@synthesize birthdayField  = _birthdayField;
@synthesize genderField    = _genderField;
@synthesize locationField  = _locationField;
@synthesize genderSwitch   = _genderSwitch;
@synthesize locationSwitch = _locationSwitch;
@synthesize birthdaySwitch = _birthdaySwitch;




- (void)viewDidLoad
{
    [super viewDidLoad];
    _genders = [NSArray arrayWithObjects:@"Male", @"Female", @"Other", nil];
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    [pickerView setDelegate:self];
    [pickerView setDataSource:self];
    [[self genderField] setInputView:pickerView];
    

    [self buildDatePickerView];
    
}

//configure datePickerView callbacks and toolbar
- (void) buildDatePickerView {
    
    _datePicker = [[UIDatePicker alloc] init];
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIToolbar *dateToolbar      = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    UIBarButtonItem *extraSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                target:nil
                                                                                action:nil];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doneButton:)];
    
    [dateToolbar setBarStyle:UIBarStyleBlackTranslucent];
    [dateToolbar setItems:[[NSArray alloc] initWithObjects: extraSpace, next, nil]];


    [_birthdayField setInputAccessoryView:dateToolbar];
    [[self birthdayField] setInputView:_datePicker];
}

//done tapped on date picker view, dismiss keyboard
- (void)doneButton:(id)sender {
    [_birthdayField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//cancel change in edit profile. no changes are saved
- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//save changes made by the user
- (IBAction)save:(id)sender {
#warning add save option here
}

//value changed for birthday, update birthday textfield
- (void) datePickerValueChanged:(id)sender {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/YYYY"];
    [_birthdayField setText:[df stringFromDate:[_datePicker date]]];
}


#pragma mark - UIPickerViewDelegate

//gender value changed, update textfield
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_genders objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [_genderField setText:[_genders objectAtIndex:row]];
    [_genderField resignFirstResponder];
}

#pragma mark - UIPIckerViewDataSource

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_genders count];
}





@end
