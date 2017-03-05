//
//  GXFPresentTransition.m
//  043-- 自定义转场动画
//
//  Created by 顾雪飞 on 17/3/5.
//  Copyright © 2017年 顾雪飞. All rights reserved.
//

#import "GXFPresentTransition.h"

@implementation GXFPresentTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

// 在这里先获取容器视图和toView，再把toView添加到容器视图，然后写动画的代码
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 动画的容器视图
    UIView *containerView = [transitionContext containerView];
    
    // toView
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // 把toView添加到容器视图
    [containerView addSubview:toView];
    
    // 动画代码
    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        // 告知转场动画结束
        [transitionContext completeTransition:YES];
    }];
}

@end
