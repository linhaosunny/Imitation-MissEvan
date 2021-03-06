//
//  MEMyViewController.m
//  Imitation-MissEvan
//
//  Created by huiren on 16/10/24.
//  Copyright © 2016年 xkl. All rights reserved.
//

#import "MEMyViewController.h"
#import "MEHeader.h"
#import "MEMyUserInfoTableViewCell.h"
#import "MEMyPersonalCenterTableViewCell.h"


@interface MEMyViewController ()<UITableViewDelegate, UITableViewDataSource, ClassViewCellDelegate>
@property (strong, nonatomic) UITableView * tableView;
@end

@implementation MEMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    [self custormView];
}

- (void)custormView
{
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];//ME_Color(243, 243, 243);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.scrollEnabled = NO;
    [self.tableView registerClass:[MEMyUserInfoTableViewCell class] forCellReuseIdentifier:@"MyUserInfo"];
    [self.tableView registerClass:[MEMyPersonalCenterTableViewCell class] forCellReuseIdentifier:@"MyPersonalCenter"];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.tableView) {//记得进入页面前刷新tableView，否则headerView的底色将不会跟随主题色切换
        [self.tableView reloadData];
    }
}

#pragma mark -
#pragma mark - ClassViewCellDelegate
- (void)classViewCell:(MEMyPersonalCenterTableViewCell *)cell didSelectWithItem:(id)item
{
    NSInteger row = [item integerValue];
    if (row == 7) {
        UIViewController * themeSwitch = ME_GetViewController(@"themeSwitch", @"MEMy");
        [self.navigationController pushViewController:themeSwitch animated:YES];
    }
}

#pragma mark -
#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MEMyUserInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyUserInfo"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    } else {
        MEMyPersonalCenterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyPersonalCenter"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        if ([ME_ThemeManage.currentThemeIdentifier isEqualToString:EAThemeNormal]) {
            MELog(@"现在是 简介白");
            cell.array = ME_DATASOURCE.myIconArray[indexPath.section - 1];
        } else {
            MELog(@"现在是 夜间模式");
            cell.array = ME_DATASOURCE.myNightIconArray[indexPath.section - 1];
        }
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    } else if (indexPath.section == 1) {
        return 220;
    } else {
        return 130;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * sectionView = [UIView new];
    sectionView.backgroundColor = self.view.backgroundColor;//[UIColor clearColor];//ME_Color(243, 243, 243);
    return sectionView;
}


@end
