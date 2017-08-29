//
//  CollapseView.m
//  CollapseViewDemo
//
//  Created by Dinesh on 29/08/17.
//  Copyright © 2017 Dinesh Saini. All rights reserved.
//

#import "CollapseView.h"

@implementation CollapseView
- (void)awakeFromNib{
    [self initalize];
}


- (instancetype)init{
    self = [super init];
    [self initalize];
    return self;
}

-(void)prepareForInterfaceBuilder
{
    [self initalize];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (CGRectIsEmpty(viewFrame)) {
        viewFrame = self.frame;
    }
    
    [self initializeFrames];
    
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            heightConstraint = constraint;
            tempConstraint = constraint;
            break;
        }
    }
    
    for (NSLayoutConstraint *bconstraint in self.constraints) {
        if (bconstraint.firstAttribute == NSLayoutAttributeBottom) {
            bottomConstraint = bconstraint;
            //            tempConstraint = bconstraint;
            break;
        }
    }
    
    heightConstraint.constant = 40;
    [self layoutIfNeeded];
    
    //    if (heightConstraint.constant == 0) {
    //        // Height constraint, half of parent view height
    //        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
    //                                                         attribute:NSLayoutAttributeHeight
    //                                                         relatedBy:NSLayoutRelationEqual
    //                                                            toItem:self.superview
    //                                                         attribute:NSLayoutAttributeHeight
    //                                                        multiplier:0.5
    //                                                          constant:self.frame.size.height]];
    //    }
    
}


- (UIButton *)Btn{
    
    profileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [profileBtn setTitle:self.btnTitle forState:UIControlStateNormal];
    [profileBtn setBackgroundColor:self.btnBgColor];
    
    // Add Left Side Bar Layer here
    btnBarLayer = [CALayer layer];
    [btnBarLayer setBackgroundColor:self.btnBarColor.CGColor];
    [profileBtn.layer addSublayer:btnBarLayer];
    
    if(self.rightImage != nil)
    {
        // Add RightImageView here
        rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.rightImage]];
        [profileBtn addSubview:rightImageView];
    }
    
    //    leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_line" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]];
    
    [profileBtn addTarget:self action:@selector(toggleView:) forControlEvents:UIControlEventTouchUpInside];
    return profileBtn;
}

- (IBAction)toggleView:(id)sender{
    
    if (isOpen) {
        heightConstraint.constant = 40;
        [UIView animateWithDuration:1 animations:^{
            isOpen = false;
            //            bottomConstraint.constant = 0;
            [self.superview layoutIfNeeded];
        }];
    }
    else{
        [UIView animateWithDuration:1 animations:^{
            isOpen = true;
            heightConstraint.constant = viewFrame.size.height;
            //            [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom
            //                                                             relatedBy:0 toItem:self.superview
            //                                                             attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:20]];
            [self.superview layoutIfNeeded];
        }];
    }
}

-(void)initalize
{
    isOpen = false;
    [self addSubview:[self Btn]];
}
- (void)initializeFrames{
    btnFrame = CGRectMake(0, 0, self.frame.size.width, 40);
    profileBtn.frame = btnFrame;
    imageFrame = CGRectMake(btnFrame.size.width - 35, 10, 20, 20);
    rightImageView.frame = imageFrame;
    btnBarLayer.frame = CGRectMake(0, 0, 3, btnFrame.size.height);
}
@end
