//
//  CollapseView.h
//  CollapseViewDemo
//
//  Created by Dinesh on 29/08/17.
//  Copyright © 2017 Dinesh Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CollapseView : UIView
{
    UIImageView *rightImageView;
    CGRect btnFrame;
    CGRect imageFrame;
    UIButton *profileBtn;
    CALayer *btnBarLayer;
    
    BOOL isOpen;
    CGRect viewFrame;
    NSLayoutConstraint *tempConstraint;
    NSLayoutConstraint *heightConstraint;
    NSLayoutConstraint *bottomConstraint;
}
@property(nonatomic,retain)IBInspectable UIColor *btnBgColor;
@property(nonatomic,retain)IBInspectable UIColor *btnBarColor;
@property(nonatomic,retain)IBInspectable NSString *btnTitle;
@property(nonatomic,retain)IBInspectable NSString *rightImage;
@property(nonatomic,retain)IBInspectable IBOutlet NSLayoutConstraint *height;

@end
