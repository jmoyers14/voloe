//
//  LoungeTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/18/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLLoungeTableViewController.h"
#import "VLCenterViewController.h"
#import "VLLoungeTableViewCell.h"
#import "AWSCore.h"
#import "VLAWSDBManager.h"
#import "VLConstants.h"
#import "VLUser.h"
#import "VLDataFormatter.h"


@interface VLLoungeTableViewController () {
    NSMutableArray *_testImages;
    VLUser *_user;
}

@end

@implementation VLLoungeTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _testImages = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        [_testImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.png", i]]];
    }
    
    [self loadData];
    
}

- (void) loadData {
    //query default user
    AWSDynamoDBCondition *condition = [VLAWSDBManager conditionWithComparison:AWSDynamoDBComparisonOperatorEQ
                                                                    andValues:@[@"jmoyers14@gmail.com"]];
    
    NSDictionary *scanFilter = [NSDictionary dictionaryWithObjectsAndKeys:condition, @"emailAddress", nil];
    
    [[[VLAWSDBManager scanTable:AWSDynamoDBUsersTableName withFilter:scanFilter andOperator:AWSDynamoDBConditionalOperatorAnd] continueWithSuccessBlock:^id(BFTask *task) {

        AWSDynamoDBScanOutput *output = [task result];
        
        if ([[output items] count] > 1) {
            NSLog(@"More than one user returned");
            return nil;
        } else {
            
            //build the monster of a user object
            NSDictionary *userData = [[output items] objectAtIndex:0];
            
            _user = [[VLUser alloc] initWithID:[[userData objectForKey:@"ID"] S]
                                       bioText:[[userData objectForKey:@"bioText"] S]
                                  emailAddress:[[userData objectForKey:@"emailAddress"] S]
                                     firstName:[[userData objectForKey:@"firstName"] S]
                                      lastName:[[userData objectForKey:@"lastName"] S]
                                     wholeName:[[userData objectForKey:@"wholeName"] S]
                                       zipcode:[[userData objectForKey:@"zipcode"] S]
                                        gender:[VLDataFormatter genderFromString:[[userData objectForKey:@"gender"] S]]
                                      location:[[userData objectForKey:@"location"] S]
                                        mobile:[[userData objectForKey:@"mobile"] S]
                               profileImageKey:[[userData objectForKey:@"profileImageKey"] S]
                                userAliasToken:[[userData objectForKey:@"userAliasToken"] S]
                           userVerificationKey:[[userData objectForKey:@"userVerificationKey"] S]
                               allowsFollowers:[VLDataFormatter boolFromString:[[userData objectForKey:@"allowFollowers"] S]]
                          allowsFriendRequests:[VLDataFormatter boolFromString:[[userData objectForKey:@"allowFriendRequests"] S]]
                             autoshareFacebook:[VLDataFormatter boolFromString:[[userData objectForKey:@"autoshareFacebook"] S]]
                                       hideDOB:[VLDataFormatter boolFromString:[[userData objectForKey:@"hideDob"] S]]
                                  hideLocation:[VLDataFormatter boolFromString:[[userData objectForKey:@"hideLocation"] S]]
                                isEmailFlagged:[VLDataFormatter boolFromString:[[userData objectForKey:@"isEmailFlagged"] S]]
                           isVisitingFirstTime:[VLDataFormatter boolFromString:[[userData objectForKey:@"isVisitingFirstTime"] S]]];
            
            
        }
        
        NSLog(@"%@", [_user wholeName]);
        
        
        
        AWSDynamoDBCondition *acceptingUserIdCondition = [VLAWSDBManager conditionWithComparison:AWSDynamoDBComparisonOperatorEQ
                                                                                       andValues:[NSArray arrayWithObject:[_user userId]]];
        AWSDynamoDBCondition *isPendingCondition       = [VLAWSDBManager conditionWithComparison:AWSDynamoDBComparisonOperatorEQ
                                                                                       andValues:[NSArray arrayWithObject:@"no"]];
        AWSDynamoDBCondition *requestingUserId         = [VLAWSDBManager conditionWithComparison:AWSDynamoDBComparisonOperatorEQ
                                                                                       andValues:[NSArray arrayWithObject:[_user userId]]];
        
        NSDictionary *filter = [NSDictionary dictionaryWithObjectsAndKeys:acceptingUserIdCondition, @"acceptingUserId", isPendingCondition, @"isPending", requestingUserId, @"requestingUserId", nil];
        
        
        
        return [VLAWSDBManager scanTable:AWSDynamoDBUserConnectionsTableName withFilter:filter andOperator:AWSDynamoDBConditionalOperatorOr];
    }] continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
        NSError *error = [task error];
        if (error) {
            NSLog(@"error");
        }
        
        NSLog(@"no error");
        
        return nil;
    }];

    

    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_testImages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VLLoungeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LoungeCell" forIndexPath:indexPath];
    
    [[cell profileImageView] setImage:[_testImages objectAtIndex:[indexPath row]]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400.0f;
}



@end
