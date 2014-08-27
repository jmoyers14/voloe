//
//  VLEditGoalTableViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/26/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLEditGoalTableViewController.h"
#import "VLGalleryCollectionViewCell.h"
@interface VLEditGoalTableViewController () {
    NSMutableArray *_pictures;
}

@end

@implementation VLEditGoalTableViewController

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
    [self loadImages];
    [self setupCollectionView];
}

-(void)setupCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(320.0, 282.0)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
}


- (void) loadImages {
    
    _pictures = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        [_pictures addObject:[NSString stringWithFormat:@"image%d.png", i]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_pictures count];
    
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VLGalleryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GalleryCell" forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:[_pictures objectAtIndex:[indexPath row]]];
    NSLog(@"%d - %@", [indexPath row], [_pictures objectAtIndex:[indexPath row]]);
    [[cell imageView] setImage:image];
    
    return cell;
    
}


#pragma mark - UICollectionViewDelegate



@end
