//
//  METitle+DanmakuScanfView.m
//  Imitation-MissEvan
//
//  Created by huiren on 16/12/13.
//  Copyright © 2016年 xkl. All rights reserved.
//

#import "METitle+DanmakuScanfView.h"

@interface METitle_DanmakuScanfView ()

@end

@implementation METitle_DanmakuScanfView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        if (self) {
            self.backgroundColor = [UIColor clearColor];
            
            self.titleView = [UIView new];
            [self addSubview:self.titleView];
            self.titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.05];
//            self.titleView.alpha = 0.05;
            [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self);
                make.top.equalTo(self).with.offset(-64);
                make.left.equalTo(self);
                make.right.equalTo(self);
                
                make.size.mas_equalTo(CGSizeMake(ME_Width, 64));
            }];
            
            self.autoScrollLabel = [[CBAutoScrollLabel alloc] init];
//            [self insertSubview:self.autoScrollLabel aboveSubview:self.titleView];
            [self.titleView addSubview:self.autoScrollLabel];
//            self.autoScrollLabel.text = @"即使天空黯淡，阳光也会照耀圣西罗";
            self.autoScrollLabel.layer.masksToBounds = YES;
            self.autoScrollLabel.layer.cornerRadius = 4;
            self.autoScrollLabel.textColor = [UIColor whiteColor];
            self.autoScrollLabel.backgroundColor = [UIColor clearColor];
            self.autoScrollLabel.font = [UIFont systemFontOfSize:16];//字体大小
            self.autoScrollLabel.labelSpacing = 30; // 开始和结束标签之间的距离
            self.autoScrollLabel.pauseInterval = 1.7; // 一秒的停顿之后再开始滚动
            self.autoScrollLabel.scrollSpeed = 30; // 每秒像素
            self.autoScrollLabel.textAlignment = NSTextAlignmentCenter; // 不使用自动滚动时的中心文本
            self.autoScrollLabel.fadeLength = 12.f;
            self.autoScrollLabel.scrollDirection = CBAutoScrollDirectionLeft;
            [self.autoScrollLabel observeApplicationNotifications];
            [self.autoScrollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleView).with.offset(32);
                make.left.equalTo(self.titleView).with.offset(60);
                make.right.equalTo(self.titleView).with.offset(-60);
//                make.edges.equalTo(self.autoScrollLabel).with.insets(UIEdgeInsetsMake(30, 60, 15, -60));
            }];
            
            self.danmakuView = [UIView new];
            [self addSubview:self.danmakuView];
            self.danmakuView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.05];
//            self.danmakuView.alpha = 0.05;
            [self.danmakuView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(self);
                make.bottom.equalTo(self).with.offset(55);
                make.left.equalTo(self);
                make.right.equalTo(self);
                
                make.size.mas_equalTo(CGSizeMake(ME_Width, 55));
            }];
            
            self.fullscreenButton = [UIButton new];
//            [self insertSubview:self.fullscreenButton aboveSubview:self.danmakuView];
            [self.danmakuView addSubview:self.fullscreenButton];
            [self.fullscreenButton setImage:[UIImage imageNamed:@"new_full_screen_28x28_-1"] forState:UIControlStateNormal];
            [self.fullscreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.danmakuView).with.offset(-10);
                make.centerY.equalTo(self.danmakuView);
                
                make.size.mas_equalTo(CGSizeMake(25, 25));
            }];
            
            self.closeOrOpenButton = [UIButton new];
//            [self insertSubview:self.closeOrOpenButton aboveSubview:self.danmakuView];
            [self.danmakuView addSubview:self.closeOrOpenButton];
            [self.closeOrOpenButton setImage:[UIImage imageNamed:@"new_close_danmu_28x28_"] forState:UIControlStateNormal];
            [self.closeOrOpenButton setImage:[UIImage imageNamed:@"new_open_danmu_28x28_"] forState:UIControlStateSelected];
            [self.closeOrOpenButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.fullscreenButton.mas_left).with.offset(-10);
                make.centerY.equalTo(self.danmakuView);
                
                make.size.mas_equalTo(CGSizeMake(25, 25));
            }];
            
            
//            self.closeOrOpenDanmaku = [UIView new];
//            [self insertSubview:self.closeOrOpenDanmaku aboveSubview:self.danmakuView];
//            self.closeOrOpenDanmaku.backgroundColor = ME_Color(112, 99, 95);
//            self.closeOrOpenDanmaku.alpha = 0.6;
//            self.closeOrOpenDanmaku.layer.masksToBounds = YES;
//            self.closeOrOpenDanmaku.layer.cornerRadius = 5;
//            self.closeOrOpenDanmaku.layer.borderColor = [UIColor whiteColor].CGColor;
//            self.closeOrOpenDanmaku.layer.borderWidth = 1;
//            [self.closeOrOpenDanmaku mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.equalTo(self.danmakuView).with.offset(-15);
//                make.centerY.equalTo(self.danmakuView);
//                //                make.left.equalTo(self.danmakuScanfView.mas_right).with.offset(15);
//                
//                make.size.mas_equalTo(CGSizeMake(55, 25));
//            }];
            
//            self.danmakuStatusLabel = [UILabel new];
//            [self insertSubview:self.danmakuStatusLabel aboveSubview:self.closeOrOpenDanmaku];
//            self.danmakuStatusLabel.font = [UIFont systemFontOfSize:11];
//            self.danmakuStatusLabel.textColor = [UIColor whiteColor];
//            self.danmakuStatusLabel.text = @"关弹幕";
//            [self.danmakuStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.centerY.equalTo(self.closeOrOpenDanmaku);
//                make.left.equalTo(self.closeOrOpenDanmaku).with.offset(10);
//                make.right.equalTo(self.closeOrOpenDanmaku).with.offset(-10);
//            }];
            
            self.danmakuScanfView = [UIView new];
//            [self insertSubview:self.danmakuScanfView aboveSubview:self.danmakuView];
            [self.danmakuView addSubview:self.danmakuScanfView];
            self.danmakuScanfView.backgroundColor = [UIColor colorWithRed:112/255.0 green:99/255.0 blue:95/255.0 alpha:0.6];//ME_Color(112, 99, 95);
//            self.danmakuScanfView.alpha = 0.6;
            self.danmakuScanfView.layer.masksToBounds = YES;
            self.danmakuScanfView.layer.cornerRadius = 5;
            self.danmakuScanfView.layer.borderColor = [UIColor whiteColor].CGColor;
            self.danmakuScanfView.layer.borderWidth = 1;
            [self.danmakuScanfView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.danmakuView).with.offset(15);
                make.centerY.equalTo(self.danmakuView);
                make.right.equalTo(self.closeOrOpenButton.mas_left).with.offset(-10);
                make.height.mas_equalTo(self.closeOrOpenButton.mas_height);
                
            }];
            
            self.placeholderLabel = [UILabel new];
            [self.danmakuScanfView addSubview:self.placeholderLabel];
//            [self insertSubview:self.placeholderLabel aboveSubview:self.danmakuScanfView];
            self.placeholderLabel.font = [UIFont systemFontOfSize:11];
            self.placeholderLabel.textColor = [UIColor whiteColor];
            self.placeholderLabel.text = @"来点弹幕啊~";
            [self.placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.danmakuScanfView);
                make.left.equalTo(self.danmakuScanfView).with.offset(10);
                make.right.equalTo(self.danmakuScanfView).with.offset(-10);
            }];
            
            self.danmakuTextField = [UITextField new];
            [self.danmakuScanfView addSubview:self.danmakuTextField];
//            [self insertSubview:self.danmakuTextField aboveSubview:self.danmakuScanfView];
            self.danmakuTextField.font = [UIFont systemFontOfSize:11];
            self.danmakuTextField.textColor = [UIColor whiteColor];
            self.danmakuTextField.backgroundColor = [UIColor clearColor];
            self.danmakuTextField.returnKeyType = UIReturnKeySend;
            self.danmakuTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            [self.danmakuTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.danmakuScanfView);
                make.left.equalTo(self.danmakuScanfView).with.offset(10);
                make.right.equalTo(self.danmakuScanfView).with.offset(-10);
                
            }];

        }
    }
    return self;
}

@end
