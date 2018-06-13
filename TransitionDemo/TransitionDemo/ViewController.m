//
//  ViewController.m
//  TransitionDemo
//
//  Created by henry on 2018/6/13.
//  Copyright © 2018年 henry. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "PresentViewController.h"
#import "CustomPresentationController.h"


@interface ViewController ()<UIViewControllerTransitioningDelegate,UIViewControllerTransitionCoordinator>
@property (weak, nonatomic) IBOutlet UIButton *showBtn;
@property (weak, nonatomic) IBOutlet UIButton *hiddenBtn;

@end

@implementation ViewController
{
   // OneViewController *oneCtr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)show:(UIButton *)sender {
    
    OneViewController *oneCtr = [[OneViewController alloc] init];
    oneCtr.modalPresentationStyle = UIModalPresentationCustom;
    oneCtr.transitioningDelegate = self;
    //self.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:oneCtr animated:YES completion:nil];
}

- (IBAction)hidden:(UIButton *)sender {
    

}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[PresentViewController alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[PresentViewController alloc] init];
    
}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
//    
//    return [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
//}


@end
