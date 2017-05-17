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
    _ballContentLayer.position = CGPointMake(self.width / 2.0, self.height / 2.0);
    [self.layer addSublayer:_ballContentLayer];
    
    _ringLayer = [CAShapeLayer layer];
    _ringLayer.frame = CGRectMake(ballContentLayerWidth / 2.0, 0, 2 * ballLayerRadius, 2 * ballLayerRadius);
    _ringLayer.cornerRadius = ballLayerRadius;
    _ringLayer.backgroundColor = color_00E480.CGColor;
    [_ballContentLayer addSublayer:_ringLayer];
}

@end
