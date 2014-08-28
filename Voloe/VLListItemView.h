//
//  VLListItemView.h
//  Voloe
//
//  Created by Jeremy Moyers on 8/28/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLListItemView : UIView
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *likesLabel;
@property (nonatomic, strong) IBOutlet UILabel *commentsLabel;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@end
