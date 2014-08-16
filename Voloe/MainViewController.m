//
//  MainViewController.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/15/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "MainViewController.h"
#import "LoungeViewController.h"
#define CENTER_TAG 1

@interface MainViewController ()
@property (nonatomic, strong) LoungeViewController *loungeViewController;
@end

@implementation MainViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void) setupViewController {
    self.loungeViewController = [[LoungeViewController alloc] initWithNibName:@"LoungeViewController" bundle:nil];
    self.loungeViewController.view.tag = CENTER_TAG;
    //add delegate
    
    [self.view addSubview:self.loungeViewController.view];
    [self addChildViewController:_loungeViewController];
    
    [_loungeViewController didMoveToParentViewController:self];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end
