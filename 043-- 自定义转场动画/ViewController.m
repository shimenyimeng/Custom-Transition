//
//  ViewController.m
//  043-- 自定义转场动画
//
//  Created by 顾雪飞 on 17/3/5.
//  Copyright © 2017年 顾雪飞. All rights reserved.
//

#import "ViewController.h"
#import "GXFViewController.h"
#import "GXFPresentTransition.h"
#import "GXFDissmissTransition.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    GXFPresentTransition *presentTransition = [GXFPresentTransition new];
    
    return presentTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    GXFDissmissTransition *dissmissTransition = [GXFDissmissTransition new];
    
    return dissmissTransition;
}

- (IBAction)buttonClick {
    
    GXFViewController *SecondVc = [GXFViewController new];
    
    // 如果自定义转场，则上一个控制器的view不会立刻消失，可以查看图层渲染信息
    SecondVc.modalPresentationStyle = UIModalPresentationCustom;
    
    SecondVc.transitioningDelegate = self;
    
    [self presentViewController:SecondVc animated:YES completion:nil];
}




@end
