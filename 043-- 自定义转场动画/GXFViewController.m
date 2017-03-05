//
//  GXFViewController.m
//  043-- 自定义转场动画
//
//  Created by 顾雪飞 on 17/3/5.
//  Copyright © 2017年 顾雪飞. All rights reserved.
//

#import "GXFViewController.h"

@interface GXFViewController ()

@end

@implementation GXFViewController

- (void)loadView {
    
    self.view = [UIView new];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.view.layer.anchorPoint = CGPointMake(0.5, 2.0);
    
    self.view.frame = [UIScreen mainScreen].bounds;
    
    // 给蓝色View添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor greenColor];
//    
//    self.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
//    
//    self.view.layer.anchorPoint = CGPointMake(0.5, 2.0);
}

- (void)panAction:(UIPanGestureRecognizer *)recognizer {
    
    CGFloat x = [recognizer translationInView:recognizer.view].x;
    
//    NSLog(@"x: %f", x);
    
    CGFloat percent = x / self.view.bounds.size.width;
    
    CGFloat a = percent * M_PI_4;
    
    CGFloat b = percent * M_PI_4;
    
    CGFloat c = percent * M_PI_4;
    
    CGFloat d = percent * M_PI_4;
    
    NSLog(@"%f", recognizer.view.transform.b);
    
    if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        
        // 需要判断转动的角度是否大于某个值
        if (ABS(recognizer.view.transform.b) > 0.16) {
            
            // dissmiss
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            
            // 回到原始位置
            recognizer.view.transform = CGAffineTransformIdentity;
        }
        
    } else {
        
        recognizer.view.transform = CGAffineTransformMakeRotation(a);
    }
    
}

@end
