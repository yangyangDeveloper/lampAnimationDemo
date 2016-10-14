//
//  ViewController.m
//  ZYY_AnimationDemo
//
//  Created by Tech-zhangyangyang on 2016/10/14.
//  Copyright © 2016年 Tech-zhangyangyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CALayer *_layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景
    UIImage *backgroundImage  = [UIImage imageNamed:@"background"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    // 自定义一个图层
    _layer = [[CALayer alloc]init];
    _layer.bounds = CGRectMake(0, 0, 30, 50);
    _layer.position = CGPointMake(50, 650);
    _layer.contents = (id)[UIImage imageNamed:@"lamp"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    //创建动画
    [self translationAnimation];
}

#pragma mark 关键帧动画
-(void)translationAnimation{
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置路径
    //绘制贝塞尔曲线
    CGMutablePathRef path = CGPathCreateMutable(); // 创建一个CGMutablePathRef 的可变路径，并返回其句柄
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);// 移动到起始点 在路径上移动当前画笔的位置到一个点，这个点由CGPoint 类型的参数指定
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);     // 绘制二次贝塞尔曲线
    
    keyframeAnimation.path = path;  // 设置path属性
    CGPathRelease(path);            // 释放路径对象
    
    //设置其他属性
    keyframeAnimation.duration  = 8.0;
    keyframeAnimation.beginTime = CACurrentMediaTime()+5;  // 设置延迟2秒执行
    
    //3.添加动画到图层，添加动画后就会执行动画
    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
}

@end
