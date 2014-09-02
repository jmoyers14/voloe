//
//  VLGridListTableViewCell.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/25/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLListItemView.h"

@protocol VLGridListTAbleViewCellDelegate <NSObject>

@required
#warning - update delegate methods with model
- (void) listItemSelected:(NSString *)item;

@end

@interface VLGridListTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet VLListItemView *colOneView;
@property (nonatomic, strong) IBOutlet VLListItemView *colTwoView;
@property (nonatomic, strong) IBOutlet VLListItemView *colThreeView;

@property (nonatomic, weak) id<VLGridListTAbleViewCellDelegate> delegate;

@end
