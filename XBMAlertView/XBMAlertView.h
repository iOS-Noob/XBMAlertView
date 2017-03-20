//
//  XBMAlertView.h
//  XBMAlertView
//
//  Created by 冯志浩 on 2017/3/20.
//  Copyright © 2017年 冯志浩. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonHandler)();
@interface XBMAlertView : UIView
@property (nonatomic, copy) ButtonHandler cancelHandler;
@property (nonatomic, copy) ButtonHandler confirmHandler;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *horizontalLine;
@property (nonatomic, strong) UIView *verticalLine;
@property (nonatomic, strong) UIImageView *exclamationImageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *cancelButton;

- (void)showThePopView;
- (void)dismissThePopView;
- (instancetype)initWithFrame:(CGRect)frame cancelHandler:(ButtonHandler)cancelHandler confirmHandler:(ButtonHandler)confirmHandler;
@end
