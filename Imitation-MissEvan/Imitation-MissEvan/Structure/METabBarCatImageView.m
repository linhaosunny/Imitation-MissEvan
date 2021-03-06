//
//  METabBarCatImageView.m
//  Imitation-MissEvan
//
//  Created by shevchenko on 16/12/10.
//  Copyright © 2016年 xkl. All rights reserved.
//

#import "METabBarCatImageView.h"
#import "MEHeader.h"

@interface METabBarCatImageView ()
@property BOOL isPlay;//判断音频是否正在播放

@end

@implementation METabBarCatImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        if (self) {
            
            self.isPlay = NO;//默认音频未播放
            //获取通知中心单例对象
            NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
            //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
            [center addObserver:self selector:@selector(notice:) name:@"play" object:nil];
            [center addObserver:self selector:@selector(changeTheme:) name:@"themeStyle" object:nil];
            
            NSMutableArray * stackImageArray = [NSMutableArray new];
            for (NSInteger i = 1; i < 141; i ++) {
                NSString * stackImageName;
                if ([ME_ThemeManage.currentThemeIdentifier isEqualToString:EAThemeNormal]) {
                    if (i < 10) {
                        stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉000%@_200x200_@1x", @(i)];
                    } else if (i > 9 && i < 100){
                        stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉00%@_200x200_@1x", @(i)];
                    } else {
                        stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉0%@_200x200_@1x", @(i)];
                    }
                } else {
                    if (i < 10) {
                        stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑000%@_200x200_@1x", @(i)];
                    } else if (i > 9 && i < 100){
                        stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑00%@_200x200_@1x", @(i)];
                    } else {
                        stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑0%@_200x200_@1x", @(i)];
                    }
                }
                UIImage * imageName = [UIImage imageNamed:stackImageName];
                [stackImageArray addObject:imageName];
                
                self.animationImages = stackImageArray;
                //动画重复次数
                self.animationRepeatCount = 10000000 * 10000000;
                //动画执行时间,多长时间执行完动画
                self.animationDuration = 8.0;
                //开始动画
                [self startAnimating];
            }

        }
    }
    return self;
}

- (void)notice:(id)sender
{
    MELog(@"睡觉猫收到消息:%@", sender);
    //如果进入播放界面，那么根据播放状态切换睡觉猫帧图
    self.isPlay = [[sender userInfo][@"isPlay"] boolValue];
    
    if (self.isPlay == YES) {
        MELog(@"正在播放, 睡醒猫动画开始执行");
        NSMutableArray * stackImageArray = [NSMutableArray new];
        for (NSInteger i = 1; i < 72; i ++) {
            NSString * stackImageName;
            if ([ME_ThemeManage.currentThemeIdentifier isEqualToString:EAThemeNormal]) {
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"miao2000%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"miao200%@_200x200_@1x", @(i)];
                }
            } else {
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 摇 音乐 黑000%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 摇 音乐 黑00%@_200x200_@1x", @(i)];
                }
            }
            UIImage * imageName = [UIImage imageNamed:stackImageName];
            [stackImageArray addObject:imageName];
            MELog(@"睡醒猫动画开始执行第%@张图片", @(i - 1));
            self.animationImages = stackImageArray;
            //动画重复次数
            self.animationRepeatCount = 10000000 * 10000000;
            //动画执行时间,多长时间执行完动画
            self.animationDuration = 2.5;
            //开始动画
            [self startAnimating];
        }

    } else {
        MELog(@"播放暂停, 睡觉猫动画开始执行");
        NSMutableArray * stackImageArray = [NSMutableArray new];
        for (NSInteger i = 1; i < 141; i ++) {
            NSString * stackImageName;
            if ([ME_ThemeManage.currentThemeIdentifier isEqualToString:EAThemeNormal]) {
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉000%@_200x200_@1x", @(i)];
                } else if (i > 9 && i < 100){
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉00%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉0%@_200x200_@1x", @(i)];
                }
            } else {
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑000%@_200x200_@1x", @(i)];
                } else if (i > 9 && i < 100){
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑00%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑0%@_200x200_@1x", @(i)];
                }
            }
            UIImage * imageName = [UIImage imageNamed:stackImageName];
            [stackImageArray addObject:imageName];
            MELog(@"睡觉猫动画开始执行第%@张图片", @(i - 1));
            self.animationImages = stackImageArray;
            //动画重复次数
            self.animationRepeatCount = 10000000 * 10000000;
            //动画执行时间,多长时间执行完动画
            self.animationDuration = 8.0;
            //开始动画
            [self startAnimating];
        }

    }
}

- (void)changeTheme:(id)sender
{
    NSString * themeStyle = [sender userInfo][@"style"];
    
    if ([themeStyle isEqualToString:EAThemeNormal]) {
        if (self.isPlay == YES) {
            MELog(@"正在播放, 简洁白睡醒猫动画开始执行");
            NSMutableArray * stackImageArray = [NSMutableArray new];
            for (NSInteger i = 1; i < 72; i ++) {
                NSString * stackImageName;
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"miao2000%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"miao200%@_200x200_@1x", @(i)];
                }
                
                UIImage * imageName = [UIImage imageNamed:stackImageName];
                [stackImageArray addObject:imageName];
                MELog(@"简洁白睡醒猫动画开始执行第%@张图片", @(i - 1));
                self.animationImages = stackImageArray;
                //动画重复次数
                self.animationRepeatCount = 10000000 * 10000000;
                //动画执行时间,多长时间执行完动画
                self.animationDuration = 2.5;
                //开始动画
                [self startAnimating];
            }

        } else {
            MELog(@"播放暂停, 简洁白睡觉猫动画开始执行");
            NSMutableArray * stackImageArray = [NSMutableArray new];
            for (NSInteger i = 1; i < 141; i ++) {
                NSString * stackImageName;
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉000%@_200x200_@1x", @(i)];
                } else if (i > 9 && i < 100){
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉00%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉0%@_200x200_@1x", @(i)];
                }
                
                UIImage * imageName = [UIImage imageNamed:stackImageName];
                [stackImageArray addObject:imageName];
                MELog(@"简洁白睡觉猫动画开始执行第%@张图片", @(i - 1));
                self.animationImages = stackImageArray;
                //动画重复次数
                self.animationRepeatCount = 10000000 * 10000000;
                //动画执行时间,多长时间执行完动画
                self.animationDuration = 8.0;
                //开始动画
                [self startAnimating];
            }

        }
    } else {
        if (self.isPlay == YES) {
            MELog(@"正在播放, 夜间模式睡醒猫动画开始执行");
            NSMutableArray * stackImageArray = [NSMutableArray new];
            for (NSInteger i = 1; i < 72; i ++) {
                NSString * stackImageName;
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 摇 音乐 黑000%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 摇 音乐 黑00%@_200x200_@1x", @(i)];
                }
                
                UIImage * imageName = [UIImage imageNamed:stackImageName];
                [stackImageArray addObject:imageName];
                MELog(@"夜间模式睡醒猫动画开始执行第%@张图片", @(i - 1));
                self.animationImages = stackImageArray;
                //动画重复次数
                self.animationRepeatCount = 10000000 * 10000000;
                //动画执行时间,多长时间执行完动画
                self.animationDuration = 2.5;
                //开始动画
                [self startAnimating];
            }
            
        } else {
            MELog(@"播放暂停, 夜间模式睡觉猫动画开始执行");
            NSMutableArray * stackImageArray = [NSMutableArray new];
            for (NSInteger i = 1; i < 141; i ++) {
                NSString * stackImageName;
                if (i < 10) {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑000%@_200x200_@1x", @(i)];
                } else if (i > 9 && i < 100){
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑00%@_200x200_@1x", @(i)];
                } else {
                    stackImageName = [NSString stringWithFormat:@"DRRR猫 睡觉 黑0%@_200x200_@1x", @(i)];
                }
                
                UIImage * imageName = [UIImage imageNamed:stackImageName];
                [stackImageArray addObject:imageName];
                MELog(@"夜间模式睡觉猫动画开始执行第%@张图片", @(i - 1));
                self.animationImages = stackImageArray;
                //动画重复次数
                self.animationRepeatCount = 10000000 * 10000000;
                //动画执行时间,多长时间执行完动画
                self.animationDuration = 8.0;
                //开始动画
                [self startAnimating];
            }
            
        }

    }
}

@end
