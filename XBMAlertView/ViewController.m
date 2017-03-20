//
//  ViewController.m
//  XBMAlertView
//
//  Created by 冯志浩 on 2017/3/20.
//  Copyright © 2017年 冯志浩. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#import "ViewController.h"
#import "XBMAlertView.h"
@interface ViewController ()
@property (nonatomic, strong) XBMAlertView *xbmAlertView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _xbmAlertView = [[XBMAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) cancelHandler:^{
        NSLog(@"concel");
    } confirmHandler:^{
        NSLog(@"confirm");
    }];
    _xbmAlertView.contentLabel.text = @"content";
}

- (IBAction)showAlertView:(UIButton *)sender {
    [_xbmAlertView showThePopView];
}


@end
