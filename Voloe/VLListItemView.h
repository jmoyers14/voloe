//
//  VLListItemView.h
//  Voloe
//
//  Created by Jeremy Moyers on 9/2/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLListItemView : UIView
@property (nonatomic, strong) IBOutlet UILabel *likesLabel;
@property (nonatomic, strong) IBOutlet UILabel *commentsLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *titleLable;

//set main title for the list Item
- (void) setTitle:(NSString *)title;

//set the number of comments on the list item
- (void) setComments:(NSInteger)comments;

//set number of likes for list item
- (void) setLikes:(NSInteger)likes;

//set the default image for list item
- (void) setImage:(UIImage *)image;

//darkens view background when highlighted
- (void) setHighlighted:(BOOL)highlighted;



@end
