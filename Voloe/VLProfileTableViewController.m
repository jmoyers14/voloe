//
//  VLProfileTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLProfileTableViewController.h"
#import "VLCenterViewController.h"
#import "VLGridListTableViewCell.h"



typedef NS_ENUM(NSInteger, SortButton) {
    SortButtonAll,
    SortButtonAchieved,
    SortButtonToBeAchieved
};


@interface VLProfileTableViewController () {
    NSMutableArray *_goals;
    NSArray *_orderOptions;
    UITextField *_hackField;
    UIPickerView *_pickerView;
}

@end

@implementation VLProfileTableViewController
@synthesize profilePicture      = _profilePicture;
@synthesize goalsAchievedButton = _goalsAchievedButton;
@synthesize goalsButton         = _goalsButton;
@synthesize assistsButton       = _assistsButton;
@synthesize friendsButton       = _friendsButton;
@synthesize followersButton     = _followersButton;
@synthesize orderButton         = _orderButton;
@synthesize allButton           = _allButton;
@synthesize achievedButton      = _achievedButton;
@synthesize toBeButton          = _toBeButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addButtonLabels];
    [self addHiddenTextField];
    [_allButton setSelected:YES];
    _goals = [[NSMutableArray alloc] init];
    _orderOptions = [NSArray arrayWithObjects:@"A-Z", @"Oldest", @"Newest", @"Most Liked", @"Least Liked", nil];
    
    
    //set tap gesture to launch camera when profile picture is tapped
    [[self profilePicture] setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tpgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showActionSheet:)];
    [[self profilePicture] addGestureRecognizer:tpgr];
    
#warning - remove dummy data
    
    [self setTitle:@"Jeremy Moyers"];
    
    for(int i = 0; i < 10; i++) {
        [_goals addObject:[NSString stringWithFormat:@"image%d.png", i]];
    }
}


//adds a hidden text field to control the presenting of the UIPickerView
//This is hacky but cleaner than adding the UIPicker to an action sheet
- (void) addHiddenTextField {
    _pickerView = [[UIPickerView alloc] init];
    [_pickerView setDelegate:self];
    [_pickerView setDataSource:self];
    _hackField = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 0.0)];
    [_hackField setInputView:_pickerView];
    [[self view] addSubview:_hackField];
}


//add title labels below the count displayed on each button
- (void) addButtonLabels {
    
#warning - remove dummy data
    //dummy data replace with real data
    NSString *goalCount = @"250";
    NSString *achievedCount = @"25";
    NSString *assistsCount = @"1004";
    NSString *friendsCount = @"3000";
    NSString *followersCount = @"2431";
    
    NSMutableAttributedString *goalTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Goals:\n%@", goalCount]];
    NSMutableAttributedString *achievedTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Goals achieved:\n%@", achievedCount]];
    NSMutableAttributedString *assistsTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Assists:\n%@", assistsCount]];
    NSMutableAttributedString *friendsTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Friends:\n%@", friendsCount]];
    NSMutableAttributedString *followersTitle = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Followers:\n%@", followersCount]];
    
    
    
    
    
    UIFont *boldFont = [UIFont boldSystemFontOfSize:16];
    
    
    [goalTitle addAttribute:NSFontAttributeName value:boldFont range: [[goalTitle string] rangeOfString:goalCount]];
    [achievedTitle addAttribute:NSFontAttributeName value:boldFont range:[[achievedTitle string] rangeOfString:achievedCount]];
    [assistsTitle addAttribute:NSFontAttributeName value:boldFont range:[[assistsTitle string] rangeOfString:assistsCount]];
    [friendsTitle addAttribute:NSFontAttributeName value:boldFont range:[[friendsTitle string] rangeOfString:friendsCount]];
    [followersTitle addAttribute:NSFontAttributeName value:boldFont range:[[followersTitle string] rangeOfString:followersCount]];
    
    [[[self goalsButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self goalsButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self goalsButton] setAttributedTitle:goalTitle forState:UIControlStateNormal];
    
    [[[self goalsAchievedButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self goalsAchievedButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self goalsAchievedButton] setAttributedTitle:achievedTitle forState:UIControlStateNormal];
    
    [[[self assistsButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self assistsButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self assistsButton] setAttributedTitle:assistsTitle forState:UIControlStateNormal];
    
    [[[self friendsButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self friendsButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self friendsButton] setAttributedTitle:friendsTitle forState:UIControlStateNormal];
    
    [[[self followersButton] titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [[[self followersButton] titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self followersButton] setAttributedTitle:followersTitle forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editProfile:(id)sender {
    [self performSegueWithIdentifier:@"EditProfile" sender:self];
}

- (IBAction)orderButton:(id)sender {
    [_hackField becomeFirstResponder];
}

- (IBAction)toggleSort:(id)sender {
    
    UIButton *toggleButton = (UIButton *)sender;
    
    switch ([toggleButton tag]) {
        case SortButtonAll:
            [_allButton setSelected:YES];
            [_achievedButton setSelected:NO];
            break;
        case SortButtonAchieved:
            [_achievedButton setSelected: YES];
            [_allButton setSelected:NO];
            [_toBeButton setSelected:NO];
            break;
        case SortButtonToBeAchieved:
            [_toBeButton setSelected:YES];
            [_allButton setSelected:NO];
            [_achievedButton setSelected:NO];
            break;
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_orderOptions count];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_orderOptions objectAtIndex:row];
}

#pragma mark - UIPickerViewDelegate

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [[self orderButton] setTitle:[_orderOptions objectAtIndex:row] forState:UIControlStateNormal];
    [_hackField resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([_goals count] + 2) / 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VLGridListTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"GridListCell" forIndexPath:indexPath];
    
    NSInteger colOne = ([indexPath row] * 3);
    NSInteger colTwo = ([indexPath row] * 3) + 1;
    NSInteger colThree = ([indexPath row] * 3) + 2;
    
    
    if (colOne < [_goals count]) {
        [[cell colOneImage] setImage:[UIImage imageNamed:[_goals objectAtIndex:colOne]]];
    } else {
        [[cell colOneImage] setHidden:YES];
    }
    
    if (colTwo < [_goals count]) {
        [[cell colTwoImage] setImage:[UIImage imageNamed:[_goals objectAtIndex:colTwo]]];
    } else {
        [[cell colTwoImage] setHidden:YES];
    }
    
    if (colThree < [_goals count]) {
        [[cell colThreeImage] setImage:[UIImage imageNamed:[_goals objectAtIndex:colThree]]];
    } else {
        [[cell colThreeImage] setHidden:YES];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

#pragma mark - show camera

- (void) showImagePicker:(UIImagePickerControllerSourceType) type {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setSourceType:type];
    [imagePickerController setDelegate:self];
    [imagePickerController setAllowsEditing:YES];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [[self profilePicture] setImage:image];
#warning - add upload image code here
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate

- (IBAction)showActionSheet:(id)sender
{
    NSString *actionSheetTitle = @"Set profile picture";
    NSString *deleteTitle = @"Delete Photo";
    NSString *chooseFromLibrary = @"Choose Existing Photo";
    NSString *takeNewPhoto = @"Take Photo";
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:deleteTitle otherButtonTitles:chooseFromLibrary, takeNewPhoto, nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"delete the image");
            break;
        case 1:
            [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
            break;
        case 2:
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
            {
                [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
            }
            else
            {
                NSLog(@"no camera");
            }
            break;
        default:
            break;
    }
}

@end
