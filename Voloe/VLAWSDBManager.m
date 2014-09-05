//
//  VLAWSDBManager.m
//  Voloe
//
//  Created by Jeremy Moyers on 9/5/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLAWSDBManager.h"

@implementation VLAWSDBManager

+ (BFTask *) scanTable:(NSString *)name withFilter:(NSDictionary *)filter andOperator:(AWSDynamoDBConditionalOperator)op{
    
    if (name) {
        AWSDynamoDB *db = [AWSDynamoDB defaultDynamoDB];
        AWSDynamoDBScanInput *scanInput = [[AWSDynamoDBScanInput alloc] init];
        [scanInput setTableName:name];
        [scanInput setScanFilter:filter];
        [scanInput setConditionalOperator:op];
        return [db scan:scanInput];
    } else {
        NSLog(@"%s: table name is nil", __PRETTY_FUNCTION__);
        return nil;
    }
}

+ (BFTask *) describeTable:(NSString *)name {
    return nil;
}

+ (BFTask *) listTables {
    AWSDynamoDB *db = [AWSDynamoDB defaultDynamoDB];
    AWSDynamoDBListTablesInput *list = [AWSDynamoDBListTablesInput new];
    return [db listTables:list];
}


+ (AWSDynamoDBCondition *) conditionWithComparison:(AWSDynamoDBComparisonOperator)comp andValues:(NSArray *)values {
    AWSDynamoDBCondition *condition = [[AWSDynamoDBCondition alloc] init];
    NSMutableArray *attributeList = [[NSMutableArray alloc] init];
    for (NSString *value in values) {
        AWSDynamoDBAttributeValue *attValue = [[AWSDynamoDBAttributeValue alloc] init];
        [attValue setS:value];
        [attributeList addObject:attValue];
    }
    
    [condition setComparisonOperator:comp];
    [condition setAttributeValueList:attributeList];
    
    return condition;
}


@end
