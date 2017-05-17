//
//  ViewController.m
//  CRYoYoBallAnimation
//
//  Created by Bear on 2017/5/17.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ViewController.h"
#import <UIView+BearSet.h>
#import "BearConstants.h"
#import "YoYoView.h"

#define color_222222 UIColorFromHEX(0x222222)
#define color_2F2F2F UIColorFromHEX(0x2F2F2F)

@interface ViewController ()
{
    YoYoView *_yoyoView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color_222222;
    
    [self createUI];
}

- (void)createUI
{
    _yoyoView = [[YoYoView alloc] initWithFrame:CGRectMake(0, 0, 270, 270)];
    _yoyoView.layer.cornerRadius = 57;
    _yoyoView.layer.masksToBounds = YES;
    _yoyoView.backgroundColor = color_2F2F2F;
    [self.view addSubview:_yoyoView];
    
    [_yoyoView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

@end
