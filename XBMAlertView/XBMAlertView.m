//
//  XBMAlertView.m
//  XBMAlertView
//
//  Created by 冯志浩 on 2017/3/20.
//  Copyright © 2017年 冯志浩. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "XBMAlertView.h"

@implementation XBMAlertView

- (instancetype)initWithFrame:(CGRect)frame cancelHandler:(ButtonHandler)cancelHandler confirmHandler:(ButtonHandler)confirmHandler {
    if (self = [super init]) {
        [self setupSubView];
        self.frame = frame;
        self.cancelHandler = cancelHandler;
        self.confirmHandler = confirmHandler;
    }
    return self;
}

- (void)setupSubView {
    CGFloat alertViewWidth = SCREEN_WIDTH - 100.0;
    CGFloat alertViewY = (SCREEN_HEIGHT - 175.0)/2 + SCREEN_HEIGHT;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    
    self.contentView = [[UIView alloc]init];
    self.contentView.frame = CGRectMake(50.0, alertViewY, alertViewWidth, 175.0);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 10.0f;
    [self addSubview:self.contentView];
    
    self.exclamationImageView = [[UIImageView alloc]init];
    self.exclamationImageView.image = [UIImage imageNamed:@"exclamation"];
    self.exclamationImageView.frame = CGRectMake((alertViewWidth - 55.0)/2, 20.0, 55.0, 55.0);
    [self.contentView addSubview:self.exclamationImageView];
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.frame = CGRectMake(0, 75.0, alertViewWidth, 50.0);
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.contentLabel];
    
    self.horizontalLine = [[UIView alloc]init];
    self.horizontalLine.frame = CGRectMake(0, 130.0, alertViewWidth, 1.0);
    self.horizontalLine.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.horizontalLine];
    
    self.verticalLine = [[UIView alloc]init];
    self.verticalLine.frame = CGRectMake(alertViewWidth/2, 130.0 + 1, 1.0, 44.0);
    self.verticalLine.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.verticalLine];
    
    self.cancelButton = [[UIButton alloc]init];
    self.cancelButton.frame = CGRectMake(0, 130.0, alertViewWidth/2, 50.0);
    self.cancelButton.tag = 100001;
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(checkButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.cancelButton];
    
    self.confirmButton = [[UIButton alloc]init];
    self.confirmButton.frame = CGRectMake(alertViewWidth/2, 130.0, alertViewWidth/2, 50.0);
    [self.confirmButton addTarget:self action:@selector(checkButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    [self.confirmButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.confirmButton];
}

- (void)showThePopView {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];
    //1.执行动画
    [UIView animateWithDuration:0.25 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.contentView.transform = CGAffineTransformMakeTranslation(0,  -SCREEN_HEIGHT);
    }];
}

- (void)dismissThePopView {
    [UIView animateWithDuration:0.25 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)checkButtonClick:(UIButton *)button {
    [self dismissThePopView];
    if (button.tag == 100001) {
        if (self.cancelHandler) {
            self.cancelHandler();
        }
    }else {
        if (self.confirmHandler) {
            self.confirmHandler();
        }
    }
}

@end
