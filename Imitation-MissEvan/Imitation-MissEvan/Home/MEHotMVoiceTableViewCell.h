//
//  MEHotMVoiceTableViewCell.h
//  Imitation-MissEvan
//
//  Created by huiren on 16/11/8.
//  Copyright © 2016年 xkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEHotMVoiceTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView * topLeftView;
@property (nonatomic, strong) UIView * topCenterView;
@property (nonatomic, strong) UIView * topRightView;
@property (nonatomic, strong) UIView * downLeftView;
@property (nonatomic, strong) UIView * downCenterView;
@property (nonatomic, strong) UIView * downRightView;

@property (nonatomic, strong) UIImageView * downShadow;

@end
