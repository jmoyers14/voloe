//
//  VLAWSDBManager.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/5/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VLConstants.h"
#import "DynamoDB.h"

@interface VLAWSDBManager : NSObject
+ (BFTask *) scanTable:(NSString *)name withFilter:(NSDictionary *)filter andOperator:(AWSDynamoDBConditionalOperator)op;
+ (BFTask *) describeTable:(NSString *)name;
+ (BFTask *) listTables;
+ (AWSDynamoDBCondition *) conditionWithComparison:(AWSDynamoDBComparisonOperator)comp andValues:(NSArray *)values;
@end
