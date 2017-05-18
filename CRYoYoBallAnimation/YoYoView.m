//
//  YoYoView.m
//  CRYoYoBallAnimation
//
//  Created by Bear on 2017/5/17.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "YoYoView.h"
#import <UIView+BearSet.h>
#import "BearConstants.h"

#define color_00E480 UIColorFromHEX(0x00E480)

@interface YoYoView ()
{
    CAShapeLayer *_ringLayer;
    CAShapeLayer *_ballLayer;
    CAShapeLayer *_ballContentLayer;
}

@end

@implementation YoYoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createUI];
        [self startAnimation];
    }
    
    return self;
}

- (void)createUI
{
    CGFloat ringLayerRadius = 73;
    CGFloat ballLayerRadius = 11;
    CGFloat ballContentLayerWidth = 232;
    
    CGRect ringLayerRect = CGRectMake(0, 0, 2 * ringLayerRadius, 2 * ringLayerRadius);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ringLayerRect];
    
    _ringLayer = [CAShapeLayer layer];
    _ringLayer.path = path.CGPath;
    _ringLayer.lineWidth = 22;
    _ringLayer.strokeColor = color_00E480.CGColor;
    _ringLayer.frame = ringLayerRect;
    _ringLayer.fillColor = [UIColor clearColor].CGColor;
    _ringLayer.position = CGPointMake(self.width / 2.0, self.height / 2.0);
    [self.layer addSublayer:_ringLayer];
    
    _ballContentLayer = [CAShapeLayer layer];
    _ballContentLayer.frame = CGRectMake(0, 0, ballContentLayerWidth, ballContentLayerWidth);
    //_ballContentLayer.borderWidth = 1;
    //_ballContentLayer.borderColor = [UIColor greenColor].CGColor;
    _ballContentLayer.position = CGPointMake(self.width / 2.0, self.height / 2.0);
    [self.layer addSublayer:_ballContentLayer];
    
    [self initRotate];
    
    _ballLayer = [CAShapeLayer layer];
    _ballLayer.frame = CGRectMake(0, 0, 2 * ballLayerRadius, 2 * ballLayerRadius);
    _ballLayer.cornerRadius = ballLayerRadius;
    _ballLayer.backgroundColor = color_00E480.CGColor;
    _ballLayer.position = CGPointMake(ballContentLayerWidth / 2.0, 0);
    [_ballContentLayer addSublayer:_ballLayer];
}

- (void)initRotate
{
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2 / 2.0);
    _ballContentLayer.affineTransform = transform;
}

- (void)startAnimation
{
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.79 :0.14 :0.13 :0.83];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.5
    ;
    animation.repeatCount = INFINITY;
    animation.byValue = @(M_PI * 2);
    animation.timingFunction = timingFunction;
    [_ballContentLayer addAnimation:animation forKey:animation.keyPath];
}

@end
