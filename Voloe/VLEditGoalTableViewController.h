//
//  VLEditGoalTableViewController.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/26/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLEditGoalTableViewController : UITableViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end
