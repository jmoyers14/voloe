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
#import "DynamoDB.h"


@interface VLLoungeTableViewController () {
    NSMutableArray *_testImages;
}

@end

@implementation VLLoungeTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    AWSCognitoCredentialsProvider *credentialsProvider = [[[AWSServiceManager defaultServiceManager] defaultServiceConfiguration] credentialsProvider];
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
    AWSDynamoDB *db = [[AWSDynamoDB new] initWithConfiguration:configuration];
    */
    // get a client with the specified config
    
    AWSCognitoCredentialsProvider *credentialsProvider = [AWSCognitoCredentialsProvider
                                                          credentialsWithRegionType:AWSRegionUSWest1
                                                          accountId:@"603022141290"
                                                          identityPoolId:@"us-east-1:e8fc3065-e3f5-41c4-a3ed-998ee4d1c645"
                                                          unauthRoleArn:@"arn:aws:iam::603022141290:role/Cognito_voloe_com_v3Unauth_DefaultRole"
                                                          authRoleArn:@"arn:aws:iam::603022141290:role/Cognito_voloe_com_v3Auth_DefaultRole"];
    
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSWest1
                                                                          credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    AWSDynamoDB *db = [AWSDynamoDB defaultDynamoDB];

    

    
    AWSDynamoDBGetItemInput *getItemInput = [[AWSDynamoDBGetItemInput alloc] init];
    [getItemInput setTableName:@"voloe-com-users"];

    AWSDynamoDBAttributeValue *emailAddress = [[AWSDynamoDBAttributeValue alloc] init];
    [emailAddress setS:@"jmoyers14@gmail.com"];
    
    
    
    
    [getItemInput setKey:[NSDictionary dictionaryWithObject:emailAddress forKey:@"emailAddress"]];
    

    
    [getItemInput setAttributesToGet:@[@"wholeName"]];
    
    BFTask *task = [db getItem:getItemInput];
   
    

    
    [task continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
    
        if ([task error]) {
            NSLog(@"%@", [[task error] localizedDescription]);
        }
        AWSDynamoDBGetItemOutput *output = [task result];
        
        AWSDynamoDBAttributeValue *name = [output valueForKey:@"wholeName"];
        
        NSLog(@"%@", [name S]);
        
        return nil;
    }];
    
    
    
    /*
    AWSDynamoDBCondition *condition = [[AWSDynamoDBCondition alloc] init];

    [condition setComparisonOperator:AWSDynamoDBComparisonOperatorEQ];

    AWSDynamoDBAttributeValue *email = [[AWSDynamoDBAttributeValue alloc] init];
    [email setS:@"jmoyers14@gmail.com"];
    
    [condition setAttributeValueList:[NSArray arrayWithObject:email]];

    NSMutableDictionary *queryStartKey = nil;



    AWSDynamoDBQueryInput *queryInput = [[AWSDynamoDBQueryInput alloc] init];
    [queryInput setTableName:@"voloe-com-users"];
    [queryInput setExclusiveStartKey:queryStartKey];
    [queryInput setKeyConditions:[NSMutableDictionary dictionaryWithObject:condition forKey:@"emailAddress"]];
    
    BFTask *task2 = [db query:queryInput];

    
    [task2 continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
        
        if ([task error]) {
            NSLog(@"%@", [[task error] description]);
        }
        AWSDynamoDBQueryOutput *output = [task result];
        
        for (NSDictionary *item in [output items]) {
            AWSDynamoDBAttributeValue *name = [item objectForKey:@"wholeName"];
            NSLog(@"name: %@", name.S);
        }
        
        
        return nil;
    }];
    */
    
    
    // See if the test table exists.
    /*
    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    [describeTableInput setTableName:@"voloe-com-users"];

    
    AWSDynamoDBListTablesInput *list = [AWSDynamoDBListTablesInput new];

    
    
    
    [[db listTables:list]
     continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {
         if ([task error]) {
             NSLog(@"%@", [[task error] description]);
         }

         AWSDynamoDBListTablesOutput *output = [task result];
         for (NSString *name in [output tableNames]) {
             NSLog(@"%@", name);
         }
         
         // If the test table doesn't exist, create one.
         if ([task.error.domain isEqualToString:AWSDynamoDBErrorDomain] && task.error.code == AWSDynamoDBErrorResourceNotFound) {
             NSLog(@"Table not found");
         }
         
         return nil;
     }];


    
   */
    
  
    
    _testImages = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        [_testImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.png", i]]];
    }
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
