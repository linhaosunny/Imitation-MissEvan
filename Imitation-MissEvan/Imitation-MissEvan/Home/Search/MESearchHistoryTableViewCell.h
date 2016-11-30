//
//  MESearchHistoryTableViewCell.h
//  Imitation-MissEvan
//
//  Created by shevchenko on 16/11/29.
//  Copyright © 2016年 xkl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MESearchHistoryTableViewCell;
@protocol deleteTheWords <NSObject>

- (void)deleteTheHistoryWords:(MESearchHistoryTableViewCell *)cell;

@end

@interface MESearchHistoryTableViewCell : UITableViewCell
@property (nonatomic, strong) NSString * searchWords;
@property (weak, nonatomic) id<deleteTheWords> delegate;

@end
