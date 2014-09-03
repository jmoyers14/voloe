/**
 * Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 */

#import "AWSCognitoDataset.h"

@class AWSCognitoSyncService;

@interface AWSCognitoDatasetMetadata()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *lastSyncCount;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSNumber *dataStorage;
@property (nonatomic, strong) NSString *lastModifiedBy;
@property (nonatomic, strong) NSDate *lastModifiedDate;
@property (nonatomic, strong) NSNumber *numRecords;

@end

@interface AWSCognitoDataset()

/**
 * Use AWSCognitoClient.openOrCreateDataset to get a dataset.
 */
- (instancetype)initWithDatasetName:(NSString *)datasetName
                      sqliteManager:(AWSCognitoSQLiteManager *)sqliteManager
                     cognitoService:(AWSCognitoSyncService *)cognitoService;

@end
