//
//  GXFDissmissTransition.m
//  043-- 自定义转场动画
//
//  Created by 顾雪飞 on 17/3/5.
//  Copyright © 2017年 顾雪飞. All rights reserved.
//

#import "GXFDissmissTransition.h"

@implementation GXFDissmissTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

// 获取fromView
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // fromView
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 设置动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        // 需要判断向哪边倒
        if (fromView.transform.b > 0) {
            
            fromView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            
            fromView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}

@end
