//
//  PresentViewController.m
//  TransitionDemo
//
//  Created by henry on 2018/6/13.
//  Copyright © 2018年 henry. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromCtr = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromCtr.view;
    
    UIViewController *toCtr = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toCtr.view;
    
    CGFloat duration = [self transitionDuration:transitionContext];
    
    if (toCtr.isBeingPresented) {
        [containerView addSubview:toView];
        
        CGFloat toWidth = containerView.frame.size.width;
        CGFloat toHeight = containerView.frame.size.height;
        toView.frame = CGRectMake(toWidth, 0, toWidth, toHeight);
       // toView.center = containerView.center;
        
        UIView *dimmingView = [[UIView alloc] init];
        dimmingView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        //[containerView addSubview:dimmingView];
       // dimmingView.center = containerView.center;
       // [containerView sendSubviewToBack:dimmingView];
        
        
        [UIView animateWithDuration:duration animations:^{
            dimmingView.frame = containerView.bounds;
            toView.frame = CGRectMake(0, 0, toWidth, toHeight);
           // toView.center = containerView.center;
            
        } completion:^(BOOL finished) {
            BOOL isCancelled = transitionContext.transitionWasCancelled;
            [transitionContext completeTransition:!isCancelled];
            
        }];
 
    }
    
    if (fromCtr.isBeingDismissed) {
        
        CGFloat fromHeight = fromView.frame.size.height;
        [UIView animateWithDuration:duration animations:^{
            fromView.frame = CGRectMake(fromView.frame.size.width, 0, fromView.frame.size.width, fromHeight);
           // fromView.center = containerView.center;
        } completion:^(BOOL finished) {
            BOOL isCancelled = transitionContext.transitionWasCancelled;
            [transitionContext completeTransition:!isCancelled];
        }];
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

@end
