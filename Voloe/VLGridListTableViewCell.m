//
//  VLGridListTableViewCell.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/25/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "VLGridListTableViewCell.h"

#define COL_HEIGHT 135.0
#define COL_WIDTH 100.0
#define COL_Y  2.0


typedef NS_ENUM(NSInteger, VLColTag) {
    VLColTagOne,
    VLColTagTwo,
    VLColTagThree
};

@implementation VLGridListTableViewCell


@synthesize colOneView   = _colOneView;
@synthesize colTwoView   = _colTwoView;
@synthesize colThreeView = _colThreeView;
@synthesize delegate     = _delegate;

- (void)awakeFromNib
{
    [self addButtons];
    [self styleViews];
}

- (void) styleViews {
    
    [[[self colOneView] layer] setShadowColor:[[UIColor grayColor] CGColor]];
    [[[self colOneView] layer] setShadowOffset:CGSizeMake(2.0, 2.0)];
    [[[self colOneView] layer] setShadowOpacity:1.0];
    [[[self colOneView] layer] setShadowRadius:5.0];
    
    [[[self colOneView] layer] setCornerRadius:5.0];
    //[[[self colOneView] layer] setMasksToBounds:YES];
    

    
    
//    [[_colTwoView layer] setCornerRadius:20.0];
//    [[_colThreeView layer] setCornerRadius:20.0];
}

- (void) addButtons {
    
    NSLog(@"adding buttons again..");
    CGRect colOneFrame   = CGRectMake(5.0, COL_Y, COL_WIDTH, COL_HEIGHT);
    CGRect colTwoFrame   = CGRectMake(110.0, COL_Y, COL_WIDTH, COL_HEIGHT);
    CGRect colThreeFrame = CGRectMake(215.0, COL_Y, COL_WIDTH, COL_HEIGHT);
    
    UIButton *colOneButton   = [[UIButton alloc] initWithFrame:colOneFrame];
    [colOneButton setTag:VLColTagOne];
    [colOneButton addTarget:self action:@selector(listItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    [colOneButton addTarget:self action:@selector(listItemHighlighted:) forControlEvents:UIControlEventTouchDown];
    [colOneButton addTarget:self action:@selector(selectionCanceled:) forControlEvents:UIControlEventTouchCancel];
    [[self contentView] addSubview:colOneButton];
    
    UIButton *colTwoButton   = [[UIButton alloc] initWithFrame:colTwoFrame];
    [colTwoButton setTag:VLColTagTwo];
    [colTwoButton addTarget:self action:@selector(listItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    [colTwoButton addTarget:self action:@selector(listItemHighlighted:) forControlEvents:UIControlEventTouchDown];
    [colTwoButton addTarget:self action:@selector(selectionCanceled:) forControlEvents:UIControlEventTouchCancel];
    [[self contentView] addSubview:colTwoButton];
    
    UIButton *colThreeButton = [[UIButton alloc] initWithFrame:colThreeFrame];
    [colThreeButton setTag:VLColTagThree];
    [colThreeButton addTarget:self action:@selector(listItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    [colThreeButton addTarget:self action:@selector(listItemHighlighted:) forControlEvents:UIControlEventTouchDown];
    [colThreeButton addTarget:self action:@selector(selectionCanceled:) forControlEvents:UIControlEventTouchCancel];
    [[self contentView] addSubview:colThreeButton];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void) listItemSelected:(id)sender {
#warning - update delegate method with model
    [_delegate listItemSelected:nil];
    [_colOneView setHighlighted:NO];
    [_colThreeView setHighlighted:NO];
    [_colTwoView setHighlighted:NO];
}

- (void) listItemHighlighted:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch ([button tag]) {
        case VLColTagOne:
            [_colOneView setHighlighted:YES];
            break;
        case VLColTagTwo:
            [_colTwoView setHighlighted:YES];
            break;
        case VLColTagThree:
            [_colThreeView setHighlighted:YES];
            break;
    }
}

- (void) selectionCanceled:(id)sender {
    [_colOneView setHighlighted:NO];
    [_colThreeView setHighlighted:NO];
    [_colTwoView setHighlighted:NO];
}



@end
