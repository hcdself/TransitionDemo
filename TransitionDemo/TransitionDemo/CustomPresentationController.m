//
//  CustomPresentationController.m
//  TransitionDemo
//
//  Created by henry on 2018/6/13.
//  Copyright © 2018年 henry. All rights reserved.
//

#import "CustomPresentationController.h"

@implementation CustomPresentationController
{
    UIView *dimmingView;
}

- (void)presentationTransitionWillBegin {
    
    dimmingView = [[UIView alloc] init];
    dimmingView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    //CGFloat width = self.containerView.frame.size.width*0.6;
    //CGFloat height = self.containerView.frame.size.height*0.6;
    //dimmingView.frame = CGRectMake(0, 0, width, height);
    dimmingView.center = self.containerView.center;
    
    [self.containerView addSubview:dimmingView];
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {

        self->dimmingView.frame = self.containerView.bounds;
        self->dimmingView.center = self.containerView.center;

    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
    
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    
}

- (void)dismissalTransitionWillBegin {
    
}

@end
